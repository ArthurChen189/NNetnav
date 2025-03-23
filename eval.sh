source export_envvars_openai.sh

python evaluation/eval_webvoyager.py \
    --process_dir $1 \
    --api_model gpt-4o \
    --max_attached_imgs $2
