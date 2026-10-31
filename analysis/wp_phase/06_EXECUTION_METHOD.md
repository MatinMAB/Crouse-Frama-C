# Execution Method

runner یک result directory جدید با UTC timestamp ایجاد می‌کند، command و environment/Git state را ثبت می‌کند، Frama-C را اجرا می‌کند و stdout/stderr، JSON، exit code و wall time را نگه می‌دارد. classification از JSON انجام می‌شود، نه exit code.

`scripts/run_one.sh` interface تک‌هدف و `scripts/run_all.sh` campaign sequential را ارائه می‌کنند. `--resume` targetی را skip می‌کند که حداقل یک JSON retained با همهٔ goalهای passed دارد. failure یک target حذف یا overwrite نمی‌شود و campaign ادامه می‌یابد.

