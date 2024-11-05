# Create a script that uses the Survey Monkey (https://www.surveymonkey.com) service, creates a survey.
#
# Sign up at https://www.surveymonkey.com
# Create a draft application at https://developer.surveymonkey.com
# No need to deploy your application. It's just for testing. Do not forget to set permissions for your application.
# After creating a draft application you will obtain an ACCESS_TOKEN which is needed to do API requests from your script.
#
# The script should accept a JSON file with questions for the survey and a text file with a list of email addresses.
# The structure of a JSON file with questions:
#
# {
#    "Survey_Name": {
#       "Page_Name": {
#           "Question1_Name": {
#               "Description" : "Description of question",
#               "Answers" : [
#                   "Answer1",
#                   "Answer2",
#                   "Answer3"
#               ]
#           },
#       }
#    }
# }
#
# There should be at least 3 questions and 2 recipients.
#

# ! This task seems to be outdated, surveymonkey's api has since been updated and looks different from the one described here
