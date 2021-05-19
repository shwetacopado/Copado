<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Email_Alert_on_Opp</fullName>
        <description>Email Alert on Opp</description>
        <protected>false</protected>
        <recipients>
            <recipient>integrationuser@sc.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>nddavoud@sc.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>RB_Robotics_Templates/Finance_Account_Creation</template>
    </alerts>
    <alerts>
        <fullName>Opportunity_Approved</fullName>
        <description>Opportunity Approved</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>RB_Robotics_Templates/Sales_Opportunity_Approval_Status_Email</template>
    </alerts>
    <alerts>
        <fullName>Opportunity_Approved1</fullName>
        <description>Opportunity Approved1</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>RB_Robotics_Templates/Sales_Opportunity_Approval_Status_Email</template>
    </alerts>
    <alerts>
        <fullName>Opportunity_Rejected</fullName>
        <description>Opportunity Rejected</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>RB_Robotics_Templates/Sales_Opportunity_Approval_Status_Email</template>
    </alerts>
    <fieldUpdates>
        <fullName>Approved</fullName>
        <field>StageName</field>
        <literalValue>Closed Won</literalValue>
        <name>Approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Approved1</fullName>
        <field>StageName</field>
        <literalValue>Closed Won</literalValue>
        <name>Approved1</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Approved_check</fullName>
        <field>Approved__c</field>
        <literalValue>1</literalValue>
        <name>Approved check</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Approved_check1</fullName>
        <field>Approved__c</field>
        <literalValue>1</literalValue>
        <name>Approved check1</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Awaiting_Approval</fullName>
        <field>StageName</field>
        <literalValue>Awaiting Approval</literalValue>
        <name>Awaiting Approval</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Awaiting_Approval1</fullName>
        <field>StageName</field>
        <literalValue>Awaiting Approval</literalValue>
        <name>Awaiting Approval1</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Awaiting_Approval_1</fullName>
        <field>StageName</field>
        <literalValue>Awaiting Approval</literalValue>
        <name>Awaiting Approval</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Closed_Won</fullName>
        <field>StageName</field>
        <literalValue>Closed Won</literalValue>
        <name>Closed Won</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Closed_won_1</fullName>
        <field>StageName</field>
        <literalValue>Closed Won</literalValue>
        <name>Closed won</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Nego</fullName>
        <field>StageName</field>
        <literalValue>Negotiation/Review</literalValue>
        <name>Nego</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Negotiation</fullName>
        <field>StageName</field>
        <literalValue>Negotiation/Review</literalValue>
        <name>Negotiation</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Status_Approved</fullName>
        <field>Discount_Percent_Status__c</field>
        <literalValue>Approved</literalValue>
        <name>Status Approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Status_Not_Approved</fullName>
        <field>Discount_Percent_Status__c</field>
        <literalValue>NoT Approved</literalValue>
        <name>Status Not Approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_stage_to_Awaiting_approval</fullName>
        <field>StageName</field>
        <literalValue>Awaiting Approval</literalValue>
        <name>Update stage to Awaiting approval</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_stage_to_closed_win</fullName>
        <field>StageName</field>
        <literalValue>Closed Won</literalValue>
        <name>Update stage to closed win</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>update_stage_to_negotiation</fullName>
        <field>StageName</field>
        <literalValue>Negotiation/Review</literalValue>
        <name>update stage to negotiation</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
</Workflow>
