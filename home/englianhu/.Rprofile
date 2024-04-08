#source("renv/activate.R")
##						Emacs编译器通过 -*- R -*-确保将达比安/德比安上的R语言软件
## 中的 Rprofile.site 文件清空。
##
## 智慧产权与版权 © 2008年 - 2018年 迪克·埃德尔布鲁特 Dirk Eddelbuettel 和 GPL'ed
##
## 查阅 help(Startup) 汇总上奏至 ~/.Rprofile 与 Rprofile.site

# ## 范例 .Rprofile
# options(width=65, digits=5)
# options(show.signif.stars=FALSE)
# setHook(packageEvent('grDevices', 'onLoad'),
#         function(...) grDevices::ps.options(horizontal=FALSE))
# set.seed(1234)
# .First <- function() cat("\n   Welcome to R!\n\n")
# .Last <- function()  cat("\n   Goodbye!\n\n")

## ======================== 微观编译器 =================================
## Micro（微观编译器） - 新式终端编译器
## https://www.tecmint.com/micro-linuxtext-editor-with-syntax-highlighting/

## ======================= 蜀道设置 ====================================
#system('sudo chmod +rwx /usr/lib/R')

.pth <- .libPaths(c('/usr/lib/R/library')) #, '/cloud/lib/R/library', '/cloud/lib/R/site-library'))
.libPaths(.pth)

## https://support.rstudio.com/hc/en-us/articles/200532197
## https://community.rstudio.com/t/r-does-not-display-korean-chinese/30889/3?u=englianhu
#Sys.setlocale("LC_CTYPE", "en_US.UTF-8")
#Sys.setlocale("LC_CTYPE", "zh_CN.UTF-8")
#Sys.setlocale(category = "LC_CTYPE", "Chinese (Simplified)_China.936")
#Sys.setlocale(locale = "Chinese")
#Sys.setlocale(locale = "Japanese")
#Sys.setlocale(locale = "English")

# rmarkdown::render('/home/englianhu/Documents/owner/ryo-cn.Rmd',  encoding = 'UTF-8')
#Sys.setlocale("LC_CTYPE", "UTF-8")
#Sys.setlocale(locale = "UTF-8")
#Sys.setlocale(category = "LC_ALL", locale = "UTF-8")
#Sys.setlocale(category = "LC_ALL", locale = "Chinese")
#Sys.setlocale(category = "LC_ALL", locale = "zh_CN.UTF-8")
#Sys.setlocale(category = "LC_ALL", locale = "zh_TW.UTF-8")
#Sys.setlocale(category = "LC_ALL", locale = "jp_JP.UTF-8")
options(encoding='UTF-8')

#dir(paste0(R.home(component = 'home'), '/etc'))
## https://www.jumpingrivers.com/blog/customising-your-rprofile/

## -------------------- 派森设置 ----------------------------------
## https://stackoverflow.com/a/13736073/3806250
# candidates <- c(Sys.getenv('R_PROFILE'),
# file.path(Sys.getenv('R_HOME'), 'etc', 'Rprofile.site'),
# Sys.getenv('R_PROFILE_USER'),
#file.path(getwd(), '.Rprofile') )
# 
# Filter(file.exists, candidates)

## https://github.com/rstudio/reticulate/issues/496#issuecomment-601446838
#Sys.setenv(RETICULATE_PYTHON = '/usr/bin/python3')
#Sys.setenv(RETICULATE_PYTHON = '/home/englianhu/anaconda3/bin/python')
## https://d.cosx.org/d/422269-r-410/11
Sys.setenv(RETICULATE_PYTHON = '/home/englianhu/anaconda3/bin/python3', 
           '_R_USE_PIPEBIND_' = 'true')
#Sys.setenv(RETICULATE_PYTHON = '/home/englianhu/anaconda3/envs/py38/bin/python')

## ------------------------ 镜像设置 ------------------------------
## 咱们设置云端镜像，以贴近众用户。
local({
  #r <- getOption('repos')
  #r['CRAN'] <- 'https://cloud.r-project.org'
  #options(repos = r)
  
  ## https://radiant-rstats.github.io/docs/install.html
  options(repos = c(CRAN = 'https://cloud.r-project.org', 
                    RSM = 'https://radiant-rstats.github.io/minicran', 
                    Omega = 'http://www.omegahat.net/R', 
                    CINC = 'https://cinc.rud.is', 
                    RForge = 'https://www.rforge.net', 
                    RSpatial = 'https://rspatial.r-universe.dev', 
                    Stan = 'https://mc-stan.org/r-packages', 
                    MSFT = 'http://cran.microsoft.com', 
                    ROpenSci = 'https://ropensci.r-universe.dev'))
  ## https://www.cynkra.com/opensource
  # Cynkra = 'https://github.com/cynkra'
  #install.packages('remotes')
  #remotes::install_github('radiant-rstats/radiant.update', upgrade = 'never')
  #radiant.update::radiant.update()
  #install.packages('cmdstanr', repos = c('https://mc-stan.org/r-packages', getOption('repos')))
})
## ==================== 读取R程序包 ===============================
## https://github.com/JanMarvin/nlsur
## https://zhuanlan.zhihu.com/p/25868387
## https://www.cnblogs.com/simplelovecs/p/5145305.html
## https://blog.csdn.net/sinat_26917383/article/details/52737901
## https://blog.csdn.net/Allen_jinjie/article/details/71603309
## https://github.com/hyenaproject/drat
## drat::addRepo("hyenaproject")
## install.packages("XXX") ## replace XXX by the name of the package!
# drat::addRepo("JanMarvin")
# install.packages("nlsur")

## R包安装失败解决方案
## https://www.jianshu.com/p/381340383c12
## options(repos='http://cran.rstudio.com/')
options(repos='https://cran.rstudio.com/')

suppressPackageStartupMessages(require('utils'))

if(!suppressPackageStartupMessages(require('BBmisc'))) {
  install.packages('BBmisc', dependencies = TRUE, 
                   lib = .pth[1], INSTALL_opts = '--no-lock')
}; suppressPackageStartupMessages(require('BBmisc'))

if(!suppressPackageStartupMessages(require('rmsfuns'))) {
  install.packages('rmsfuns', dependencies = TRUE, 
                   lib = .pth[1], INSTALL_opts = '--no-lock')
}; suppressPackageStartupMessages(require('rmsfuns'))

if(!suppressPackageStartupMessages(require('drat'))) {
  install.packages('drat', dependencies = TRUE, 
                   lib = .pth[1], INSTALL_opts = '--no-lock')
}; suppressPackageStartupMessages(require('drat'))

if(!suppressPackageStartupMessages(require('devtools'))) {
  install.packages('devtools', dependencies = TRUE, 
                   lib = .pth[1], INSTALL_opts = '--no-lock')
  devtools::install_github('r-lib/devtools')
}; suppressPackageStartupMessages(require('devtools'))
conflicted::conflict_prefer('check', 'devtools', quiet = TRUE)

if(!suppressPackageStartupMessages(require('Ipaper'))) {
  devtools::install_github('kongdd/Ipaper')
  #devtools::install_git('https://gitee.com/adv-r/Ipaper')
  # or from gz file
  # install.packages('../Ipaper_0.1.5.9000.tar.gz', repos = NULL, type = 'source', dependencies = TRUE)
  # $sudo apt install -y libfftw3-dev
}; suppressPackageStartupMessages(require('Ipaper'))
conflicted::conflict_prefer('ldply', 'plyr', quiet = TRUE)
conflicted::conflicts_prefer(Ipaper::is_empty, .quiet = TRUE)

if(!suppressPackageStartupMessages(require('miniCRAN'))) {
  ## https://andrie.github.io/miniCRAN/articles/miniCRAN-introduction.html
  devtools::install_github('andrie/miniCRAN')
}; suppressPackageStartupMessages(require('miniCRAN'))

if(!suppressPackageStartupMessages(require('rhub'))) {
  ## https://github.com/r-hub/rhub
  remotes::install_github('r-hub/rhub')
}; suppressPackageStartupMessages(require('rhub'))

if(!suppressPackageStartupMessages(require('startup'))) {
  ## https://github.com/HenrikBengtsson/startup
  remotes::install_github('HenrikBengtsson/startup', ref = 'develop')
}; suppressPackageStartupMessages(require('startup'))

if(!suppressPackageStartupMessages(require('Rdym'))) {
  devtools::install_github('wrathematics/Rdym')
}; suppressPackageStartupMessages(require('Rdym'))

## https://www.jumpingrivers.com/blog/customising-your-rprofile/
if(!suppressPackageStartupMessages(require('rprofile'))) {
  remotes::install_github('csgillespie/rprofile')
}; suppressPackageStartupMessages(require('rprofile'))

if(!suppressPackageStartupMessages(require('prompt'))) {
  # Used for nice prompts
  remotes::install_github('gaborcsardi/prompt')
}; suppressPackageStartupMessages(require('prompt'))

if(!suppressPackageStartupMessages(require('colorout'))) {
  # Used for nice colours in the terminal; not for Windows
  remotes::install_github('jalvesaq/colorout')
}; suppressPackageStartupMessages(require('colorout'))

if(!suppressPackageStartupMessages(require('tidyverse'))) {
  devtools::install_github('tidyverse/tidyverse')
}; suppressPackageStartupMessages(require('tidyverse'))

if(!suppressPackageStartupMessages(require('lubridate'))) {
  devtools::install_github('tidyverse/lubridate')
}; suppressPackageStartupMessages(require('lubridate'))

if(!suppressPackageStartupMessages(require('prettycode'))) {
  devtools::install_github('https://github.com/r-lib/prettycode')
}; suppressPackageStartupMessages(require('prettycode'))

if(!suppressPackageStartupMessages(require('openxlsx2'))) {
  remotes::install_github('JanMarvin/openxlsx2')
}; suppressPackageStartupMessages(require('openxlsx2'))

## https://github.com/r-lib/crayon
## https://github.com/r-lib/progress
## https://github.com/r-hub/rhub
#library(prettycode, exclude = c('!', 'print'))

suppressPackageStartupMessages(require('dplyr'))
conflicted::conflicts_prefer(dplyr::filter, .quiet = TRUE)
conflicted::conflicts_prefer(dplyr::select, .quiet = TRUE)
conflicted::conflicts_prefer(base::print, .quiet = TRUE)
conflicted::conflicts_prefer(base::load, .quiet = TRUE)

pkgs <- c('MASS', 'conflicted', 'prettycode', 'crayon', 'progress', 'rhub', 'plyr', 'purrr', 'readr', 'tidyr', 'pryr', 'broom', 'formattable', 'git2r', 'knitr', 'kableExtra', 'data.table', 'tibble', 'tibbletime', 'magrittr', 'forecast', 'fable', 'fabletools', 'usethis', 'tidytuesdayR')
suppressPackageStartupMessages(load_pkg(pkgs))
rm(pkgs)

## https://stackoverflow.com/a/17486231/3806250
#.First()
.First <- function() {
  Rdym::RdymEnable()
  #suppressPackageStartupMessages(startup::install(path = '/home/englianhu'))
  #suppressPackageStartupMessages(startup::startup(all = TRUE))
}

## =================== 有一个梦，由我启动 =======================
# 电力线，显示系统读取速度均值和当前项目路径。
if (!require('rprofile')) {
	if (interactive()) prompt::set_prompt(prompt::new_prompt_powerline())
	
	## https://www.jumpingrivers.com/blog/customising-your-rprofile/
	if (interactive() && suppressPackageStartupMessages(requireNamespace('rprofile'))) {
		# 仅用于 Makefiles
		rprofile::create_make_functions()
		
		# 启动设置
		rprofile::set_startup_options()
		
		# R文艺坊与终端设置
		if (rprofile::is_terminal()) {
			# https://github.com/csgillespie/rprofile/blob/master/R/set-terminal.R
			rprofile::set_terminal()
		} else {
			rprofile::set_rstudio()
		}
		.env = rprofile::set_functions()
		suppressMessages(attach(.env))
		# 显示无线网络与R会话控制（终端互动）
		# 仅用于礼逆袭
		suppressWarnings(rprofile::set_startup_info())
	}
	
	# 启动R文艺坊时列印项目
	setHook('rstudio.sessionInit', function(newSession) {
		active_rproj = rprofile::get_active_rproj()
		if (!is.null(active_rproj)) {
			base::message(glue::glue("{crayon::yellow('R-project:')} {active_rproj}"))
		}
	}, action = 'append')
	
	#rmsfuns::suppressPackageStartupMessages(.First())
	tryCatch(suppressWarnings(startup::startup(all = TRUE)), 
			 error = function(ex) 
			 base::message('.Rprofile error: ', 
						   base::conditionMessage(ex)))
	}


