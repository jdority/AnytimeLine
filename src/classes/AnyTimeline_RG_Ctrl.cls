public class AnyTimeline_RG_Ctrl {
    
	@AuraEnabled
    public static List<TimelineEvent> getTimelineEvents(String sObjectName, String titleField, String startDateTimeField){
        String q = 'SELECT Id,' + 
            String.valueOf(titleField) + ',' + 
            String.valueOf(startDateTimeField) + ' FROM ' + 
            String.valueOf(sObjectName);        

        List<sObject> sObjectList = Database.query(q);
        
        List<TimelineEvent> tEvents = new List<TimelineEvent>();
        if(isAccessible(sObjectName)) {

                for (sObject obj : sObjectList) {
                    TimelineEvent tEvent = new TimelineEvent(obj.Id,
                                                             String.valueOf(obj.get(titleField)),
                                                             Date.valueOf(obj.get(startDateTimeField))
                                                            );
                    tEvents.add(tEvent);
                }
            
        }
        return tEvents;
    }
    
    @AuraEnabled
    public static List<TimelineEvent> getTimelineEventsFiltered(String sObjectName, String titleField, String startDateTimeField, String parentField, String recordId){
        String q = 'SELECT Id,' + 
            String.valueOf(titleField) + ',' + 
            String.valueOf(startDateTimeField) + ' FROM ' + 
            String.valueOf(sObjectName) + ' WHERE ' + 
            String.valueOf(parentField) + ' = \'' + recordId + '\'';
        
        List<sObject> sObjectList = Database.query(q);
        
        List<TimelineEvent> tEvents = new List<TimelineEvent>();
        if(isAccessible(sObjectName)) {

                for (sObject obj : sObjectList) {
                    TimelineEvent tEvent = new TimelineEvent(obj.Id,
                                                             String.valueOf(obj.get(titleField)),
                                                             Date.valueOf(obj.get(startDateTimeField))
                                                            );
                    tEvents.add(tEvent);
                }

        }
        return tEvents;
    }
    
    public class TimelineEvent{
        @AuraEnabled
        public String Id {get;set;}
        @AuraEnabled
        public String title {get;set;}
        @AuraEnabled
        public Date startDate {get;set;}
                
        public TimelineEvent(String i,String t, Date s){
            this.Id = i;
            this.title = t;
            this.startDate = s;
        }
    }   

    public static Boolean isAccessible(String sObjectType){
        SObjectType schemaType = Schema.getGlobalDescribe().get(sObjectType);
        return schemaType.getDescribe().isAccessible();
    }
}