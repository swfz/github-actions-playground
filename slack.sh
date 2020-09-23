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
repo_url=$(echo $7 | sed 's/ //g')
avatar_url=$8
repository=$9
ref=${10}
sha=${11}
message=${12}
result=${13}

echo '----------'
echo $color
echo $workflow
echo $actor
echo $event_name
echo $action
echo $run_id
echo $repo_url
echo $avatar_url
echo $repository
echo $ref
echo $sha
echo $message
echo $result
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
                "type": "mrkdwn",
                "text": "${result} Repo: <${repo_url}|${repository}> Workflow: <${repo_url}/actions/runs/${run_id} | ${workflow}> Author: ${actor} (${ref}>) (${sha}) ${message}"
              }
            ]
          }
        ]
      }
    ]
}
EOS
