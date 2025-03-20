# load all the environment variables
source export_envvars_openai.sh
export TOKENIZER_DIR="stanfordnlp/llama8b-nnetnav-live"
export VLLM_API_KEY="nnetnav-live" 

MODEL=stanfordnlp/llama8b-nnetnav-live
RESULT_DIR="my_webvoyager_results_with_nnetnav_live"
DATA=webvoyager

# run the experiment
PYTHONPATH=./ python src/run_agent.py \
    --model $MODEL \
    --result_dir $RESULT_DIR \
    --instruction_path src/agent/prompts/jsons_openweb/p_cot_llama_action_history.json \
    --agent_name my_nnetnav_live_llama \
    --n_jobs 8 \
    --max_obs_length 20000 \
    --data $DATA \
    --provider openai \
    --temperature 0.01 \
    --top_p 0.9 