({
    doInit : function(component, event, helper) {
        if (component.get('v.filterByParentRecord') == false) {
            helper.fireApex(
                arguments,"c.getTimelineEvents", 
                {
                    sObjectName : component.get("v.sObjectName"),
                    titleField : component.get("v.titleField"),
                    startDateTimeField : component.get("v.startDateTimeField")
                }, "v.timelineEvents"
            );
        } else {
            helper.fireApex(
                arguments,"c.getTimelineEventsFiltered", 
                {
                    sObjectName : component.get("v.sObjectName"),
                    titleField : component.get("v.titleField"),
                    startDateTimeField : component.get("v.startDateTimeField"),
                    parentField : component.get("v.parentField"),
                    recordId : component.get('v.recordId')
                }, "v.timelineEvents"
            );
        }
    }
})