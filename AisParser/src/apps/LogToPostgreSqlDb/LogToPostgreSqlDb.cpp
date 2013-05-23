#include <AisParserTemplates.h>

//Output Type
#include <AisPostgreSqlDatabaseWriterSingleAISTable.h>

//Input Type
#include <AisFlatFileInputSource.h>

//Parser Type
#include <AisSatSentenceParser.h>
#include <AisMsisSentenceParser.h>

int main(int argc, char** argv)
{
	//parse args
	if(argc>10 || argc<8)
	{
		flatfileToDatabaseParserUsage();
		return -1;
	}
	string filename = argv[1];
	string db_user = argv[2];
	string db_pass = argv[3];
	string db_host = argv[4];
	string db_name = argv[5];
	string db_table = argv[6];
	string db_numIterations = argv[7];
	int unix_start = 0;
	int unix_end = 0;
	if(argc==10)
	{
		unix_start = atoi(argv[8]); 
		unix_end = atoi(argv[9]);
	}
	if (unix_end < unix_start) {
		cerr << "invalid start time entered: end time " << unix_end << " < " <<  "start_time " << unix_start << endl;
		return -1;
	}

	AisFlatFileInputSource aisInputSource(filename);
	string db_static_table = "";
	if (unix_start == 0) {
		databaseParser<AisPostgreSqlDatabaseWriterSingleAISTable, AisSatSentenceParser>(aisInputSource,db_user, db_pass, db_host, 
		db_name, db_table, db_numIterations, db_static_table);
	} else {
		databaseParserLimitTime<AisPostgreSqlDatabaseWriterSingleAISTable, AisSatSentenceParser>(aisInputSource,db_user, db_pass, db_host, 
		db_name, db_table, db_numIterations, db_static_table, unix_start, unix_end);
	}
	//databaseParser<AisPostgreSqlDatabaseWriter, AisMsisSentenceParser>(aisInputSource,db_user, db_pass, db_host, db_name, db_table, db_numIterations, db_static_table);

	return 0;
}