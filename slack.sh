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
run_id=$(echo $6 | sed 's/ //g')
repo_url=$7
avatar_url=$8

echo '----------'
echo $color
echo $workflow
echo $actor
echo $event_name
echo $action
echo $run_id
echo $repo_url
echo $avatar_url
echo '----------'

curl -X POST -H 'Content-type: application/json' ${SLACK_WEBHOOK_URL} \
  -d @- <<EOS
{
    "attachments": [
      {
        "color": "${color}",
        "fallback": "Required plain-text summary of the attachment.",
        "blocks": [
          {
            "type": "context",
            "elements": [
              {
                "type": "image",
                "image_url": "${avatar_url}",
                "alt_text": "${actor}"
              },
              {
                "type": "mrkdwn",
                "text": "Workflow: <${repo_url}/actions/runs/${run_id}|${workflow}>"
              }
            ]
          }
        ]
      }
    ]
}
EOS
