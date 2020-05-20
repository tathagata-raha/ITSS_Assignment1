USAGE:
1. Creating reminders:
./qn4.sh create <message> <time in HH:MM format> <optional date in MMMDD format>
It will return an id of the reminder
2. Deleting reminder
./qn4.sh delete <id>
It will delete the corresponding reminder.
3. Editing reminders
./qn4.sh edit <id> <message> <time in HH:MM format> <optional date in MMMDD format>
It will edit the reminders witht the corresponding id.
4. Listing reminders
./qn4.sh
It will list all the reminders

Note1:Time needs to be 24 hr format
Note2:Date needs to be in MMMDD format i.e. 5th January will be Jan5 and so on