#!/bin/bash

# repo
# message
# commit
# author
# action
# eventName
# workflow
# ref


workflow=$1
actor=$2
event_name=$3
action=$4

echo $workflow
echo $actor
echo $event_name
echo $action

#curl -X POST -H 'Content-type: application/json' ${SLACK_WEBHOOK_URL} \
#  -d @- <<EOS
#{
#    "attachments": [
#      {
#        "color": "#36a64f",
#        "fallback": "Required plain-text summary of the attachment.",
#        "blocks": [
#          {
#            "type": "context",
#            "elements": [
#              {
#                "type": "mrkdwn",
#                "text": "Location: *Dogpatch* <https://github.com/swfz|swfz>)"
#              }
#            ]
#          }
#        ]
#      }
#    ]
#}
#EOS
