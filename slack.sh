#!/bin/bash

# repo
# message
# commit
# author
# action
# eventName
# workflow
# ref


color=$1
workflow=$2
actor=$3
event_name=$4
action=$5

echo $color
echo $workflow
echo $actor
echo $event_name
echo $action

curl -X POST -H 'Content-type: application/json' ${SLACK_WEBHOOK_URL} \
  -d @- <<EOS
{
    "attachments": [
      {
        "color": "#36a64f",
        "fallback": "Required plain-text summary of the attachment.",
        "blocks": [
          {
            "type": "context",
            "elements": [
              {
                "type": "mrkdwn",
                "text": "Location: *Dogpatch* <https://github.com/swfz|swfz>)"
              }
            ]
          }
        ]
      }
    ]
}
EOS
