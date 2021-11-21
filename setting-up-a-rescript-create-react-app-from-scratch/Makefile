.PHONY: version
version: ## version
	./node_modules/.bin/bsb --version

.PHONY: build-watch
build-watch: ## build rescript with watch mode
	./node_modules/.bin/bsb -make-world -w

.PHONY: up
up: ## start app
	npm run start

.PHONY: clean
clean: ## clean .bs.js files by generated rescript
	./node_modules/.bin/bsb -clean-world

################################################################################
# Utility-Command tree
################################################################################
.PHONY: tree
tree: ## Tree ツリー構造で表現
	tree -a -I "\.DS_Store|\.git|node_modules|vendor\/bundle" -N

################################################################################
# Utility-Command help
################################################################################
.DEFAULT_GOAL := help

################################################################################
# マクロ
################################################################################
# $(1): Makefile名
# Makefileの中身を抽出してhelpとして1行で出す
# $(1): Makefile名
define help
  grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(1) \
  | grep --invert-match "## non-help" \
  | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
endef
################################################################################
# タスク
################################################################################
.PHONY: help
help: ## Make タスク一覧
	@echo '######################################################################'
	@echo '# Makeタスク一覧'
	@echo '# $$ make XXX'
	@echo '# or'
	@echo '# $$ make XXX --dry-run'
	@echo '######################################################################'
	@echo $(MAKEFILE_LIST) \
	| tr ' ' '\n' \
	| xargs -I {included-makefile} $(call help,{included-makefile})
