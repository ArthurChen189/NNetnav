from typing import Any

import tiktoken
from transformers import LlamaTokenizer  # type: ignore
from transformers import AutoTokenizer  # type: ignore
import os

class Tokenizer(object):
    def __init__(self, provider: str, model_name: str) -> None:
        self.model_name = model_name
        if "gpt" not in model_name:
            self.tokenizer = AutoTokenizer.from_pretrained(os.environ["TOKENIZER_DIR"])
            self.tokenizer.add_special_tokens = False  # type: ignore[attr-defined]
            self.tokenizer.add_bos_token = False  # type: ignore[attr-defined]
            self.tokenizer.add_eos_token = False  # type: ignore[attr-defined]
        elif provider == "openai":
            self.tokenizer = tiktoken.encoding_for_model(model_name)
        elif provider == "huggingface" and "llama" in model_name:
            self.tokenizer = LlamaTokenizer.from_pretrained(model_name)
            # turn off adding special tokens automatically
            self.tokenizer.add_special_tokens = False  # type: ignore[attr-defined]
            self.tokenizer.add_bos_token = False  # type: ignore[attr-defined]
            self.tokenizer.add_eos_token = False  # type: ignore[attr-defined]
        else:
            raise NotImplementedError

    def encode(self, text: str) -> list[int]:
        if "gpt" not in self.model_name:
            return self.tokenizer.encode(text, add_special_tokens=False)
        else:
            return self.tokenizer.encode(text)

    def decode(self, ids: list[int]) -> str:
        return self.tokenizer.decode(ids)

    def __call__(self, text: str) -> list[int]:
        return self.tokenizer.encode(text)
