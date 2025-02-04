## https://unleash-shiny.rinterface.com

# -------------- Load Packages -----------------------------

require('BBmisc')
lib('shiny')
lib('shinythemes')
lib('shinydashboard')
lib('shinydashboardPlus')
lib('bs4Dash')
lib('dashboardthemes')
lib('shinyWidgets')
lib('shinyjs')
lib('shinyvalidate')
lib('memoise')
if(!require('XML')) devtools::install_github('omegahat/XML')
lib('XML')

# -------------- Prefer Conflict -----------------------------

conflicts_prefer(shinydashboardPlus::dashboardPage, .quiet = TRUE)
conflicts_prefer(shinydashboardPlus::dashboardHeader, .quiet = TRUE)
conflicts_prefer(shinydashboardPlus::dashboardSidebar, .quiet = TRUE)
conflicts_prefer(shinydashboard::sidebarMenu, .quiet = TRUE)
conflicts_prefer(shinydashboard::menuItem, .quiet = TRUE)
conflicts_prefer(shinydashboard::menuSubItem, .quiet = TRUE)
conflicts_prefer(shinydashboard::dashboardBody, .quiet = TRUE)
conflicts_prefer(shinydashboard::tabItems, .quiet = TRUE)
conflicts_prefer(shinydashboard::tabItem, .quiet = TRUE)
conflicts_prefer(shinydashboardPlus::taskItem, .quiet = TRUE)
conflicts_prefer(shinydashboardPlus::messageItem, .quiet = TRUE)
conflicts_prefer(shinydashboardPlus::notificationItem, .quiet = TRUE)
conflicts_prefer(shinydashboardPlus::box, .quiet = TRUE)
conflicts_prefer(shinydashboard::updateTabItems, .quiet = TRUE)
conflicts_prefer(shinydashboardPlus::dashboardFooter, .quiet = TRUE)
#conflicts_prefer(shiny::runExample, .quiet = TRUE)
#lib(pkgs)

# -------------- Set Parameters -----------------------------

#menus <- data.frame(
#  choices = c('🇬🇧 ENGLISH',# = 'en', 
#              '🇨🇳 简体中文',# = 'cn', 
#              '🇹🇼 繁体中文',# = 'tw', 
#              '🇯🇵 日本語',# = 'jp', 
#              '🇰🇷 한국어',# = 'kr', 
#              '🇬🇷 Ελληνικά',# = 'gr', 
#              '🇩🇪 Deutsch',# = 'de', 
#              '🇫🇷 Français',# = 'fr', 
#              '🇮🇹 Italiano'),# = 'it'), 
#  lnk = c('ryo-en', 'ryo-cn', 'ryo-tw', 'ryo-jp', 'ryo-kr', 'ryo-gr', 'ryo-de', 'ryo-fr', 'ryo-it'), 
#  tabItem = c('en', 'cn', 'tw', 'jp', 'kr', 'gr', 'de', 'fr', 'it'))

## Active tab to select radio button in Shiny
## https://www.javacodexamples.com/examples/active-tab-to-select-radio-button-in-shiny
##
rb_choices = list(
  '🇬🇧 ENGLISH' = 'en', 
  '🇨🇳 简体中文' = 'cn', 
  '🇹🇼 繁体中文' = 'tw', 
  '🇯🇵 日本語' = 'jp', 
  '🇰🇷 한국어' = 'kr', 
  '🇬🇷 Ελληνικά' = 'gr', 
  '🇩🇪 Deutsch' = 'de', 
  '🇫🇷 Français' = 'fr', 
  '🇮🇹 Italiano' = 'it')
tabItem_choices = list(
  '🇬🇧 ENGLISH' = 'en', 
  '🇨🇳 简体中文' = 'cn', 
  '🇹🇼 繁体中文' = 'tw', 
  '🇯🇵 日本語' = 'jp', 
  '🇰🇷 한국어' = 'kr', 
  '🇬🇷 Ελληνικά' = 'gr', 
  '🇩🇪 Deutsch' = 'de', 
  '🇫🇷 Français' = 'fr', 
  '🇮🇹 Italiano' = 'it')

### creating custom logo object
logo <- shinyDashboardLogoDIY(
  boldText = 'ξηg', 
  mainText = 'Lιαη Ημ', 
  textSize = 16, 
  badgeText = '🐉 ®γσ', 
  badgeTextColor = 'white', 
  badgeTextSize = 2, 
  badgeBackColor = "#40E0D0", 
  badgeBorderRadius = 3)

## https://stackoverflow.com/a/50979068/3806250
alignCenter <- memoise(function(el) {
  htmltools::tagAppendAttributes(
    el, style = "
      width:500vw;
      height:100vh;
      background-color: rgba(255, 255, 255, 0.35); /* 35% opaque white */
      padding: 0.25em;
      color: #FFD64D;
      background: linear-gradient(155DEG, #146275 0%, #33A8C4 100%);
      transition: all 0.45s;
      display:flex;
      flex-wrap: wrap;
      align-items:center;
      justify-content:center;
    ")
})


# -------------- ui -----------------------------

ui <- shinyUI(
  
  #fluidPage(
  ## https://dreamrs.github.io/shinyWidgets/reference/setBackgroundColor.html
  # use a gradient in background
  #  setBackgroundColor(
  #    color = c('#2171B5', '#F7FBFF'),
  #    gradient = 'radial',
  #    direction = c('top', 'left')
  #    ),
  #...)
  #
  ## https://rinterface.github.io/shinydashboardPlus/articles/more-skins.html
  dashboardPage(#skin = 'midnight', 
    header = dashboardHeader(title = logo), 
    sidebar = dashboardSidebar(
      minified = TRUE, collapsed = FALSE, 
      ## https://stackoverflow.com/questions/52382832/r-shiny-dashboard-body-dependant-from-shiny-subitem-selection
      ## https://ducthanhnguyen.github.io/MaterialAdminLTE/index3.html
      
      sidebarMenu(
        id = 'tabs', 
        menuItem('🚩中科红旗☁️', tabName = 'menu', 
                 ## https://getbootstrap.com/docs/3.4/components/#glyphicons
                 ## https://fontawesome.com/icons 
                 icon = icon('font-awesome'), startExpanded = TRUE, 
                 menuSubItem('🏠 Home', tabName = 'home'), 
                 menuSubItem('🇬🇧 ENGLISH', tabName = 'en'), 
                 menuSubItem('🇨🇳 简体中文', tabName = 'cn'), 
                 menuSubItem('🇹🇼 繁体中文', tabName = 'tw'), 
                 menuSubItem('🇯🇵 日本語', tabName = 'jp'), 
                 menuSubItem('🇰🇷 한국어', tabName = 'kr'), 
                 menuSubItem('🇬🇷 Ελληνικά', tabName = 'gr'), 
                 menuSubItem('🇩🇪 Deutsch', tabName = 'de'), 
                 menuSubItem('🇫🇷 français', tabName = 'fr'), 
                 menuSubItem('🇮🇹 Italiano', tabName = 'it'))#, 
        #menuItem('Appendices', tabName = 'append', 
        #         icon = icon('th'), startExpanded = TRUE, 
        #         menuSubItem('Author', tabName = 'auth'), 
        #         menuSubItem('Reference', tabName = 'ref'))
      )), 
    
    body = dashboardBody(
      shinyDashboardThemes(theme = 'blue_gradient'), 
      
      ## https://stackoverflow.com/questions/52198452/how-to-change-the-background-color-of-the-shiny-dashboard-body
      tags$head(tags$style(HTML('
            /* logo */
            /* .skin-blue .main-header .logo { */
            /* background-color: #F4B943; */
            /* } */
            
            /* logo when hovered */
            .skin-blue .main-header .logo:hover {
            /* background-color: #33A8C4; */
              color: #FFD64D;
              background: linear-gradient(155DEG, #146275 0%, #33A8C4 100%);
              transition: all 0.45s;
            /*   &:hover{ */
            /*     background: linear-gradient(155DEG, #146275 20%, #33A8C4 80%); */
            /*   } */
            }
            
            /* navbar (rest of the header) */
            .skin-blue .main-header .navbar {
            /* background-color: #F4B943; */
            /* color: #FFD64D; */
               background: linear-gradient(155DEG, #146275 0%, #33A8C4 100%);
               transition: all 0.45s;
            /*   &:hover{ */
            /*     background: linear-gradient(155DEG, #146275 20%, #33A8C4 80%); */
            /*   } */
            }
            
            /* main sidebar */
            /* .skin-blue .main-sidebar { */
            /* background-color: #F4B943; */
            /* } */
            
            /* active selected tab in the sidebarmenu */
            /* .skin-blue .main-sidebar .sidebar .sidebar-menu .active a { */
            /* background-color: #FF0000; */
            /* background: linear-gradient(155DEG, #146275 0%, #33A8C4 100%); */
            /*   transition: all 0.45s; */
            /*   &:hover{ */
            /*     background: linear-gradient(155DEG, #146275 20%, #33A8C4 80%); */
            /*   } */
            /* } */
            
            /* other links in the sidebarmenu */
            /* .skin-blue .main-sidebar .sidebar .sidebar-menu a { */
            /* background-color: #00FF00; */
            /* color: #000000; */
            /* } */
            
            /* other links in the sidebarmenu when hovered */
            /* .skin-blue .main-sidebar .sidebar .sidebar-menu a:hover { */
            /* background-color: #FFD64D; */
            /* color: #FFD64D; */
            /* } */
            
            /* toggle button */
            .skin-blue .main-header .navbar .sidebar-toggle {
            /* background-color: #33A8C4; */
              color: #FFD64D;
              background: linear-gradient(155DEG, #146275 0%, #33A8C4 100%);
              transition: all 0.45s;
              &:hover{
                background: linear-gradient(155DEG, #146275 20%, #33A8C4 80%);
              }
            }
            
            /* toggle button when hovered */
            .skin-blue .main-header .navbar .sidebar-toggle:hover {
            /* background-color: #FFD64D; */
              color: #FFD64D;
              background: linear-gradient(155DEG, #002C54 0%, #4CB5F5 100%);
              transition: all 0.45s;
              &:hover{
                background: linear-gradient(155DEG, #002C54 20%, #4CB5F5 80%);
              }
            }
            
            /* navbar */
            .navbar-custom-menu {
              /* color: #FFD64D; */
              background-color: transparent;
            }
            
            /* sidebarColumn */
            .sidebarCollapsed {
            /*  position: absolute; */
            /*  top: -25px; */
            /*  padding-top: -50px; */
            }
            .main-sidebar.shiny-bound-input {
            /*  position: absolute; */
            /*  top: 25px; */
            /*  right 25px; */
            /*  padding-top: 30px; */
            /*  padding-right: 30px; */
            }
            
            /* body */
            /* .content-wrapper, .right-side { */
            .content-wrapper {
            /* background-color: #7DA2D1; */
              color: #FFD64D;
              background: linear-gradient(155DEG, #002C54 0%, #4CB5F5 100%);
              transition: all 0.45s;
            /*  &:hover{ */
            /*    background: linear-gradient(155DEG, #002C54 20%, #4CB5F5 80%); */
            /*  } */
            }
            
            /* body when hovered */
            /* .content-wrapper, .right-side, .content-wrapper:hover, .right-side:hover { */
            /*   background-color: #7DA2D1; */
            /*   color: #FFD64D; */
            /*   background: linear-gradient(155DEG, #002C54 0%, #4CB5F5 100%); */
            /*   transition: all 0.45s; */
            /*   &:hover{ */
            /*     background: linear-gradient(155DEG, #002C54 20%, #4CB5F5 80%); */
            /*   } */
            /* } */
            
            /* footer */
            .skin-blue .main-footer {
            /* background-color: #33A8C4; */
              color: #FFD64D;
              background: linear-gradient(155DEG, #146275 0%, #33A8C4 100%);
              transition: all 0.45s;
            /*   &:hover{ */
            /*     background: linear-gradient(155DEG, #146275 20%, #33A8C4 80%); */
            /*   } */
            }
            
            /* footer */
            .pull-right.hidden-xs {
              /* color: #FFD64D; */
              background-color: transparent;
            }
            
            /* footer when hovered */
            /* .skin-blue .main-footer .main-footer:hover { */
            /*   background-color: #F4B943; */
            /*   color: #FFD64D; */
            /*   background: linear-gradient(155DEG, #146275 0%, #33A8C4 100%); */
            /*   transition: all 0.45s; */
            /*   &:hover{ */
            /*     background: linear-gradient(155DEG, #146275 20%, #33A8C4 80%); */
            /*   } */
            /* } */
            
            /* ## https://stackoverflow.com/questions/59760316/change-the-color-of-text-in-validate-in-a-shiny-app */
            .shiny-output-error-validation {
            /* background-color: #FFD64D; */
              color: #FF0000;
              font-size: 36px;
              font-weight: bold;
              display:flex;
              align-items:center;
              justify-content:center;
              background: linear-gradient(155DEG, #002C54 0%, #4CB5F5 100%);
              transition: all 0.45s;
              &:hover{
                background: linear-gradient(155DEG, #002C54 20%, #4CB5F5 80%);
              }
            }
            
            '))), 
      
      tabItems(
        tabItem(tabName = 'home', h2('®️Studio ☁️', align = 'center'),
                alignCenter(
                  prettyRadioButtons(
                    inputId = 'rb', label = NULL, 
                    choices = rb_choices, #menus$choices, 
                    shape = 'curve', animation = 'pulse', 
                    selected = character(0), status = 'primary', 
                    thick = TRUE, width = '100%', bigger = TRUE, 
                    icon = icon('registered'))
                )
        ), 
        tabItem(tabName = 'en', h2('🇬🇧 ENGLISH', align = 'center'), 
                #tags$iframe(src = 'http://rpubs.com/englianhu/ryo-en', 
                #            height = 800, width = '100%', frameborder = 0)#, 
                #HTML(readLines('诸子百家考工记/ryo-en.html'))#, 
                #includeHTML('诸子百家考工记/ryo-en.html')#,
                htmlOutput('ryo_en')
                #htmlOutput('frame')
        ), 
        tabItem(tabName = 'cn', h2('🇨🇳 简体中文', align = 'center'), 
                #tags$iframe(src = 'https://rpubs.com/englianhu/ryo-cn', 
                #            height = 800, width = '100%', frameborder = 0)#, 
                #HTML(readLines('诸子百家考工记/ryo-cn.html'))#, 
                #includeHTML('诸子百家考工记/ryo-cn.html')#,
                htmlOutput('ryo_cn')
                #htmlOutput('frame')
        ), 
        tabItem(tabName = 'tw', h2('🇹🇼 繁体中文', align = 'center'), 
                #tags$iframe(src = 'https://rpubs.com/englianhu/ryo-tw', 
                #            height = 800, width = '100%', frameborder = 0)#, 
                #HTML(readLines('诸子百家考工记/ryo-tw.html'))#, 
                #includeHTML('诸子百家考工记/ryo-tw.html')#,
                htmlOutput('ryo_tw')
                #htmlOutput('frame')
        ), 
        tabItem(tabName = 'jp', h2('🇯🇵 日本語', align = 'center'), 
                #tags$iframe(src = 'https://rpubs.com/englianhu/ryo-jp', 
                #            height = 800, width = '100%', frameborder = 0)#, 
                #HTML(readLines('诸子百家考工记/ryo-jp.html'))#, 
                #includeHTML('诸子百家考工记/ryo-jp.html')#,
                htmlOutput('ryo_jp')
                #htmlOutput('frame')
        ), 
        tabItem(tabName = 'kr', h2('🇰🇷 한국어', align = 'center'), 
                #tags$iframe(src = 'https://rpubs.com/englianhu/ryo-gr', 
                #            height = 800, width = '100%', frameborder = 0)#, 
                #HTML(readLines('诸子百家考工记/ryo-gr.html'))#, 
                #includeHTML('诸子百家考工记/ryo-gr.html')#,
                ## https://stackoverflow.com/questions/28845499/r-shiny-how-to-align-a-gvistable-to-the-center-in-shinyapp
                htmlOutput('ryo_kr'), br(), br(), br(), 
                HTML("<p align='center'><iframe width='560' height='315' src='https://www.youtube.com/embed/BrfA1HeOgko' title='YouTube video player' frameborder='0' allow='accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture' allowfullscreen></iframe></p>")
                #htmlOutput('frame')
        ), 
        tabItem(tabName = 'gr', h2('🇬🇷 Ελληνικά', align = 'center'), 
                #tags$iframe(src = 'https://rpubs.com/englianhu/ryo-gr', 
                #            height = 800, width = '100%', frameborder = 0)#, 
                #HTML(readLines('诸子百家考工记/ryo-gr.html'))#, 
                #includeHTML('诸子百家考工记/ryo-gr.html')#,
                ## https://stackoverflow.com/questions/28845499/r-shiny-how-to-align-a-gvistable-to-the-center-in-shinyapp
                htmlOutput('ryo_gr'), br(), br(), br(), 
                HTML("<p align='center'><iframe width='560' height='315' src='https://www.youtube.com/embed/BrfA1HeOgko' title='YouTube video player' frameborder='0' allow='accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture' allowfullscreen></iframe></p>")
                #htmlOutput('frame')
        ), 
        tabItem(tabName = 'de', h2('🇩🇪 Deutsch', align = 'center'), 
                #tags$iframe(src = 'https://rpubs.com/englianhu/ryo-de', 
                #            height = 800, width = '100%', frameborder = 0)#, 
                #HTML(readLines('诸子百家考工记/ryo-de.html'))#, 
                #includeHTML('诸子百家考工记/ryo-de.html')#,
                ## https://stackoverflow.com/questions/28845499/r-shiny-how-to-align-a-gvistable-to-the-center-in-shinyapp
                htmlOutput('ryo_de'), br(), br(), br(), 
                HTML("<p align='center'><iframe width='560' height='315' src='https://www.youtube.com/embed/BrfA1HeOgko' title='YouTube video player' frameborder='0' allow='accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture' allowfullscreen></iframe></p>")
                #htmlOutput('frame')
        ), 
        tabItem(tabName = 'fr', h2('🇫🇷 Français', align = 'center'), 
                #tags$iframe(src = 'https://rpubs.com/englianhu/ryo-fr', 
                #            height = 800, width = '100%', frameborder = 0)#, 
                #HTML(readLines('诸子百家考工记/ryo-fr.html'))#, 
                #includeHTML('诸子百家考工记/ryo-fr.html')#,
                ## https://stackoverflow.com/questions/28845499/r-shiny-how-to-align-a-gvistable-to-the-center-in-shinyapp
                htmlOutput('ryo_fr'), br(), br(), br(), 
                HTML("<p align='center'><iframe width='560' height='315' src='https://www.youtube.com/embed/BrfA1HeOgko' title='YouTube video player' frameborder='0' allow='accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture' allowfullscreen></iframe></p>")#, 
                #tags$script(HTML("
                #        var p = document.getElementById('ryo_fr')
                #        $(p).attr('align', 'center');"))
                #htmlOutput('frame')
        ), 
        tabItem(tabName = 'it', h2('🇮🇹 Italiano', align = 'center'), 
                #tags$iframe(src = 'https://rpubs.com/englianhu/ryo-it', 
                #            height = 800, width = '100%', frameborder = 0)#, 
                #HTML(readLines('诸子百家考工记/ryo-it.html'))#, 
                #includeHTML('诸子百家考工记/ryo-it.html')#,
                ## https://stackoverflow.com/questions/28845499/r-shiny-how-to-align-a-gvistable-to-the-center-in-shinyapp
                htmlOutput('ryo_it'), br(), br(), br(), 
                HTML("<p align='center'><iframe width='560' height='315' src='https://www.youtube.com/embed/BrfA1HeOgko' title='YouTube video player' frameborder='0' allow='accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture' allowfullscreen></iframe></p>")
                #htmlOutput('frame')
        )
      )#, 
      #tabItems(
      #  tabItem(tabName = 'auth', h2('Author', align = 'center'), 
                #tags$iframe(src = 'http://rpubs.com/englianhu/ryo-eng', 
                #            height = 800, width = '100%', frameborder = 0)#, 
                #HTML(readLines('诸子百家考工记/ryo-eng.html'))#, 
      #          includeHTML('诸子百家考工记/ryo-eng.html')#,
                #htmlOutput('ryo_eng')
      #  ), 
      #  tabItem(tabName = 'ref', h2('参考文献', align = 'center'), 
      #          p(
      #  HTML("<a href = 'https://www.r-bloggers.com/2014/11/another-take-on-building-a-multi-lingual-shiny-app'>Another take on building a multi-lingual shiny app</a>")
      # ))
      #  )
    ), 
    
    footer = dashboardFooter(
      left = p(
        HTML("<a href='https://www.scibrokes.com'>Sςιβrοκεrs Trαdιηg®</a>"), 
        br(), 
        tags$a(href = 'https://www.scibrokes.com', target = '_blank', 
               tags$img(height = '13px', alt = 'scibrokes', #align = 'right', 
                        #src = '诸子百家考工记/Scibrokes.png')), 
                        src = 'https://raw.githubusercontent.com/scibrokes/owner/master/诸子百家考工记/Scibrokes.png')), 
        HTML("<a href='https://www.scibrokes.com'>世博量化®</a>"), 
        '企业知识产权®及版权®所有，盗版必究。', 
        ), 
      right = p(
        br(), 
        tags$a(href = 'https://www.pku.edu.cn', target = '_blank', 
               tags$img(height = '13px', alt = 'scibrokes', #align = 'right', 
                        #src = '诸子百家考工记/Peking University 02.png')), 
                        src = 'https://raw.githubusercontent.com/scibrokes/owner/master/诸子百家考工记/Peking%20University%2002.png')), 
        HTML(paste0("<a href='https://www.pku.edu.cn'>", span('北京大学', style = 'color:blue'), "</a>")), 
        '🐉 ®γσ ξηg 2022 原著')
      ), 
    title = 'DashboardPage'))


# -------------- server -----------------------------

server <- shinyServer(function(input, output, session) {
  
  #observe({
    ## https://stackoverflow.com/questions/56064805/displaying-html-file-using-includehtml-in-shiny-is-not-working-with-renderui
    ## https://stackoverflow.com/questions/33020558/embed-iframe-inside-shiny-app
  #  query <- menus[which(menus$choices == input$rb), 2]
  #  lnk <<- paste0('https://rpubs.com/englianhu/', query)
  #  })
    
  #output$frame <- renderUI({
  #  input$rb
  #  ui_lnk <- tags$iframe(src = lnk, height = 800, width = '100%', frameborder = 0)
  #  print(ui_lnk)
  #  ui_lnk
  #})
  
  observeEvent(input$rb, {
    updateTabItems(session, 'tabs', selected = input$rb)
  })
  
  output$ryo_en <- renderUI(includeHTML('诸子百家考工记/ryo-en.html'))
  output$ryo_cn <- renderUI(includeHTML('诸子百家考工记/ryo-cn.html'))
  output$ryo_tw <- renderUI(includeHTML('诸子百家考工记/ryo-tw.html'))
  output$ryo_jp <- renderUI(includeHTML('诸子百家考工记/ryo-jp.html'))
  output$ryo_kr <- renderUI({
    validate(
      need(is.error(file.exists('诸子百家考工记/ryo-kr.html')), 
           HTML('<ruby>건설<rp>(</rp><rt>geonseol</rt><rp>)</rp>중<rp>(</rp><rt>jung</rt><rp>)</rp></ruby> !')),
      errorClass = 'Missing-Data-Class'
    )
    includeHTML('诸子百家考工记/ryo-kr.html')
    })
  
  output$ryo_gr <- renderUI({
    validate(
      need(is.error(file.exists('诸子百家考工记/ryo-gr.html')), 'Υπό κατασκευή !'), 
      errorClass = 'Missing-Data-Class'
    )
    includeHTML('诸子百家考工记/ryo-gr.html')
    })
  
  output$ryo_de <- renderUI({
    validate(
      need(is.error(file.exists('诸子百家考工记/ryo-de.html')), 'En construction !'), 
      errorClass = 'Missing-Data-Class'
    )
    includeHTML('诸子百家考工记/ryo-de.html')
    })
  
  output$ryo_fr <- renderUI({
    validate(
      need(is.error(file.exists('诸子百家考工记/ryo-fr.html')), 'Im Bau !'), 
      errorClass = 'Missing-Data-Class'
    )
    includeHTML('诸子百家考工记/ryo-fr.html')
    })
  
  output$ryo_it <- renderUI({
    validate(
      need(is.error(file.exists('诸子百家考工记/ryo-it.html')), 'In costruzione !'), 
      errorClass = 'Missing-Data-Class'
    )
    includeHTML('诸子百家考工记/ryo-it.html')
    })
  
  observeEvent(input$tabs, {
    updatePrettyRadioButtons(session, 'rb', selected = input$tabs)
  })

})


# -------------- shinyApp() -----------------------------

shinyApp(ui, server)
#runApp(app.R, display.mode = 'showcase')

