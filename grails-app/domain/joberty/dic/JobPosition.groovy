package joberty.dic

class JobPosition {
	static enableSolrSearch = true
	static solrAutoIndex = true

	public static final String TYPE_CONTRACT="Contract"
	public static final String TYPE_PERMANENT="Permanent"
	public static final String TYPE_FREELANCE="Freelance"
	String name
	int type=0 //0-system defined, 1-user defined
	
    static constraints = {
    }
}
