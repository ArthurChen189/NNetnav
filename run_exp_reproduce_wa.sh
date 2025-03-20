# load all the environment variables
source export_envvars_wa.sh
source export_envvars_openai.sh
export TOKENIZER_DIR="stanfordnlp/llama8b-nnetnav-wa"

MODEL=stanfordnlp/llama8b-nnetnav-wa
RESULT_DIR="my_webarena_results_wa_reproduce"
DATA=webarena

# run the experiment
PYTHONPATH=./ python src/run_agent.py \
    --model $MODEL \
    --result_dir $RESULT_DIR \
    --instruction_path src/agent/prompts/jsons/p_cot_llama_action_history_bgym.json \
    --agent_name my_nnetnav_llama \
    --n_jobs 1 \
    --max_obs_length 20000 \
    --data $DATA \
    --provider openai \
    --temperature 0.01 \
    --top_p 0.9 