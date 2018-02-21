@isTest(seeAllData=true)
public class AnyTimeline_RG_TestCtrl {
	static testMethod void getEventsTest() {
        AnyTimeline_RG_Ctrl.getTimelineEvents('Event', 'Description', 'StartDateTime');
        Event ev = [SELECT Description,Id,StartDateTime,WhoId FROM Event WHERE WhoId != null LIMIT 1];
        AnyTimeline_RG_Ctrl.getTimelineEventsFiltered('Event', 'Description', 'StartDateTime', 'WhoId', ev.WhoId);
    }
}