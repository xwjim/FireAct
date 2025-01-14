# cd finetune/llama_full
# torchrun --nnodes 1 --nproc_per_node 2 --master_port='29501' finetune.py \
#     --model_name_or_path /home/disk/wxu/Ziya-LLaMA-13B/ \
#     --data_path ../../data/finetune/alpaca_format/hotpotqa.json \
#     --bf16 True \
#     --output_dir ../models/full_models/ziya_agent \
#     --num_train_epochs 30 \
#     --per_device_train_batch_size 2 \
#     --per_device_eval_batch_size 4 \
#     --gradient_accumulation_steps 8 \
#     --evaluation_strategy "no" \
#     --save_strategy "steps" \
#     --save_steps 2000 \
#     --save_total_limit 1 \
#     --learning_rate 2e-3 \
#     --weight_decay 0. \
#     --warmup_ratio 0.03 \
#     --lr_scheduler_type "cosine" \
#     --logging_steps 1 \
#     --fsdp "full_shard auto_wrap" \
#     --fsdp_transformer_layer_cls_to_wrap 'LlamaDecoderLayer' \
#     --tf32 True


cd finetune/llama_lora
python finetune.py \
     --base_model /home/disk/wxu/Baichuan2-7B \
     --data_path ../../data/finetune/alpaca_format/hotpotqa.json\
     --micro_batch_size 8 \
     --num_epochs 30 \
     --output_dir ../models/lora/llama2 \
     --val_set_size 0.01 \
     --cutoff_len 512 \
