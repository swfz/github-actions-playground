#!/bin/bash

# repo
# message
# commit
# author
# action
# eventName
# workflow
# ref


result=$1
workflow=$2
actor=$3
event_name=$4
action=$5
run_id=$(echo $6 | sed 's/ //g')
repo_url=$(echo $7 | sed 's/ //g')
avatar_url=$8
repository=$9
ref=${10}
sha=$(echo ${11} | sed 's/ //g')
message=${12}

short=$(echo ${sha:0:7})
branch=$(echo ${ref} | sed 's/refs\/heads\///g')

echo '----------'
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

declare -A COLORS
COLORS=(
  ["failure"]="#A30100"
  ["success"]="#2EB886"
  ["netral"]="#DAA038"
  ["cancelled"]="#A30100"
  ["timed_out"]="#A30100"
)


color=${COLORS["${result}"]}

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
                "text": "${result} Workflow <${repo_url}/actions/runs/${run_id} | ${workflow}> in <${repo_url}|${repository}> (<${repo_url}/tree/${branch}|${branch}>) (<${repo_url}/commit/${sha}|${short}>)"
              }
            ]
          }
        ]
      }
    ]
}
EOS
