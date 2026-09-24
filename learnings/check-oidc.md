################################################################################################
      - name: Debug GitHub OIDC claims
        shell: bash
        run: |
          set -euo pipefail

          TOKEN="$(
            curl -sSf \
              -H "Authorization: bearer $ACTIONS_ID_TOKEN_REQUEST_TOKEN" \
              "${ACTIONS_ID_TOKEN_REQUEST_URL}&audience=sts.amazonaws.com" \
            | jq -r '.value'
          )"

          echo "=========================================="
          echo "GitHub OIDC claims"
          echo "=========================================="

          PAYLOAD="$(
            echo "$TOKEN" \
              | cut -d '.' -f2 \
              | tr '_-' '/+' \
              | base64 -d 2>/dev/null
          )"

          echo "$PAYLOAD" | jq '{
            iss,
            aud,
            sub,
            repository,
            repository_id,
            repository_owner,
            repository_owner_id,
            ref,
            ref_type,
            event_name,
            environment,
            workflow,
            workflow_ref,
            job_workflow_ref,
            job_workflow_sha
          }'
       ######################################################################################   
