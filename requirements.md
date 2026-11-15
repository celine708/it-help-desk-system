# IT Help Desk Management System: Requirements

Personal project by Celine Hashem | Fictional company scenario

## 1. Background and Goal

Cedar Trade Group is a fictional distribution company with about 60 employees in 5 departments: Sales, Accounting, HR, Operations, and Management. It has a small IT team of 4 technicians.

Today, employees report IT problems by email, phone call, or WhatsApp message. Nothing is recorded in one place. As a result, the IT manager cannot tell how many problems are open, which ones are late, which problems repeat the most, or how busy each technician is. Some requests are forgotten, and employees have no way to know the status of their request.

**Goal:** Build a system that records every support request (ticket), tracks it until it is closed, and gives the IT manager clear reports. Employees report problems, technicians solve them, and the IT manager monitors performance.

## 2. Ticket Categories and Priorities

**Categories:** Email, Hardware, Network, Software, Accounts and Passwords, Printer.

**Priorities and target resolution times:**

| Priority | Meaning | Target resolution time |
| --- | --- | --- |
| Critical | A system is down or a department cannot work | 4 hours |
| High | One user is blocked from doing their job | 8 hours |
| Medium | Work is affected but can continue | 24 hours |
| Low | Minor issue or general request | 72 hours |

## 3. Functional Requirements

The system must:

1. Record each ticket with the employee, their department, the category, the priority, a title, and a description.
2. Assign each ticket to one technician.
3. Track the ticket status: Open, In Progress, Resolved, or Closed.
4. Record the date and time the ticket was opened and the date and time it was resolved.
5. Assign a target resolution time based on the ticket priority.
6. Identify tickets that have passed their target resolution time (overdue tickets).
7. Record a short resolution note describing how the problem was solved, so repeated problems can be solved faster.
8. Allow the manager to see open, overdue, and resolved tickets at any time.
9. Show the workload and average resolution time for each technician.
10. Show which departments and which problem categories generate the most tickets.

## 4. Questions the Manager Wants Answered

- How many tickets are open or overdue right now?
- What is the average resolution time by category and by priority?
- What percentage of tickets are resolved within their target time?
- How many tickets does each technician handle?
- Which department opens the most tickets, and for what type of problem?
- Which problem types happen most often, and could they be prevented?
- Which months or weekdays are the busiest?

## 5. Assumptions and Out of Scope

**Assumptions:**

- Each ticket is handled by one technician at a time.
- Tickets are never deleted, only closed, so history is preserved for reporting.
- Resolution time is counted in calendar hours (working hours and weekends are ignored for simplicity).
- A ticket is overdue when it is still open past its target time, or was resolved after its target time.
- Employees are identified by their company email.

**Out of scope:** a web or mobile form for employees to submit tickets, automatic email notifications, and asset or software license management.
