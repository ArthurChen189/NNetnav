import playwright.sync_api
import json
import os

# we use a global playwright instance
_PLAYWRIGHT = None


def _set_global_playwright(pw: playwright.sync_api.Playwright):
    global _PLAYWRIGHT
    _PLAYWRIGHT = pw


def _get_global_playwright():
    global _PLAYWRIGHT
    if not _PLAYWRIGHT:
        pw = playwright.sync_api.sync_playwright().start()
        _set_global_playwright(pw)

    return _PLAYWRIGHT


# register the open-ended task
from browsergym.core.registration import register_task
from .webvoyager_task import WebVoyagerTask


# get the current path, and use that to load configs located in the same directory
def get_configs():
    import os

    current_path = os.path.dirname(os.path.realpath(__file__))
    config_path = os.path.join(current_path, "webvoyager_data/WebVoyager_data.jsonl")
    return [json.loads(s) for s in open(config_path).readlines()]


configs = get_configs()
ALL_WEBVOYAGER_TASK_IDS = []

TASK_COUNTER_MAP = {
    'allrecipes': 45,
    'amazon': 41,
    'apple': 43,
    'arxiv': 43,
    'bbc_news': 42,
    'coursera': 42,
    'cambridge_dictionary': 43,
    'espn': 44,
    'github': 41,
    'google_map': 41,
    'google_search': 43,
    'huggingface': 43,
    'wolfram_alpha': 46,
    'all': 557
}

FILTER_WORDS = ["flights", "booking"]
TASK = os.environ.get("TASK", "all")
print("-" * 100)
print(f"TASK: {TASK}")
print("-" * 100)
for idx, _c in enumerate(configs):
    web_name = _c["web_name"]
    display_web_name = web_name.replace(" ", "_").lower()
    should_filter = False
    for word in FILTER_WORDS:
        if word.lower() in display_web_name:
            should_filter = True
            break
    if TASK.lower() != "all" and TASK.lower() != display_web_name:
        should_filter = True
    if should_filter:
        continue
    task_id = _c["id"]
    # replace all " " with "_"
    task_id = task_id.replace(" ", "_")
    gym_id = f"webvoyager_{task_id}"
    register_task(
        gym_id,
        WebVoyagerTask,
        task_kwargs={
            "web_name": web_name,
            "id": _c["id"],
            "goal": _c["ques"],
            "start_url": _c["web"],
        },
    )
    ALL_WEBVOYAGER_TASK_IDS.append(gym_id)