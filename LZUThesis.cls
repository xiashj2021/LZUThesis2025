\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{LZUThesis}[2025/06/02 2025 Thesis for LZUer By xiashj2021]
\LoadClass[12pt, a4paper, UTF8, openany, oneside]{ctexbook}

% 关键设置：重定义中文强调字体为宋体
\let\oldemph\emph
\renewcommand{\emph}[1]{\oldemph{\songti #1}}

% 部分内容参考了https://github.com/suchot/LZUThesis2017，
% - 适配了2021最新的毕业论文要求：http://jwc.lzu.edu.cn/lzupage/2021/02/25/N20210225145827.html
% - 适配了2022最新的毕业论文要求：http://jwc.lzu.edu.cn/lzupage/2023/03/06/N20230306160525.html
% - 2023同2022
%============================ 一些章节的配置文件 =========%
%%
%% the chapter title format
%%
% 正文结构，分别以“第一章”、“1”、“1.1”、“1.1.1”….等树层次格式依次标出。
% 章的编号居中，字体为黑体，三号，加粗，居中，单倍行距，段前24磅，段后18磅，如“第一章”；
% 节的编号置顶格，按顺序分层，如“1”，“1.1”，“1.1.1”层次，以少为宜，编号与标题之间空1个字符间隙，如“1.1 本科生资料使用”、“1.1.1 本科生数据分析”，字体依次为二级标题黑体，四号，顶左，单倍行距，段前24磅，段后6磅；
% 三级标题黑体，小四号，首行缩进2个汉字符，单倍行距，段前12磅，段后6磅。各层次标题用阿拉伯数字连续编号，数字之间用小圆点“.”相隔。
% 正文另起一行。正文：宋体，小四（英文用Times New Roman字体，12磅），两端对齐，段落首行左缩进2个汉字符，行间距为固定值20磅，段前段后0磅。
%
\setcounter{secnumdepth}{3}    % 控制编号深度
%\CTEXsetup[format+={\sffamily\bfseries\small}]{chapter}
\def\CTEX@chapter@nameformat{\bfseries\heiti\zihao{3}} % 应该是加粗（黑体加粗）
\def\CTEX@chapter@titleformat{\bfseries\heiti\fontspec[Path = ./fonts/, Extension = .ttc]{Msyhbd}\zihao{3}} % 应该是加粗（黑体加粗）
\def\CTEX@chapter@beforeskip{0pt}
\def\CTEX@chapter@afterskip{18pt}
% \def\CTEX@chapter@titleformat{\bfseries\heiti\fontspec{Times New Roman}\zihao{3}}
%
%%
%% the section title format
%% 二级标题黑体，四号，顶左，单倍行距，段前24磅，段后6磅
\def\CTEX@section@format{\mdseries\heiti\fontspec[Path = ./fonts/, Extension = .ttf]{SimHei}\zihao{4}}
\def\CTEX@section@numberformat{\fontspec[Path = ./fonts/, Extension = .ttf]{SimHei}\zihao{4}}
\def\CTEX@section@beforeskip{24pt}
\def\CTEX@section@afterskip{6pt}
% \def\CTEX@section@beforeskip{-3ex \@plus -1ex \@minus -.2ex}
% \def\CTEX@section@afterskip{1.0ex \@plus .2ex}
% \ctexset{
%     section = {
%         format      = \heiti\zihao{4},          % 全局字号
%         beforeskip  = 24pt,               % 标题前间距
%         afterskip   = 6pt,                % 标题后间距
%         % afterindent = true,               % 可选：标题后段落缩进
%     }
% }
%%
%% the subsection title format
%% 三级标题黑体，小四号，首行缩进2个汉字符，单倍行距，段前12磅，段后6磅。
\def\CTEX@subsection@format{\mdseries\heiti\fontspec[Path = ./fonts/, Extension = .ttf]{SimHei}\zihao{-4}}
\def\CTEX@subsection@numberformat{\fontspec[Path = ./fonts/, Extension = .ttf]{SimHei}\zihao{-4}}
\def\CTEX@subsection@indent{2\ccwd}
\def\CTEX@subsection@beforeskip{12pt}
\def\CTEX@subsection@afterskip{6pt}
%%
%% the subsubsection title format
%%
\def\CTEX@subsubsection@format{\songti\zihao{-4}}
% \def\CTEX@subsubsection@numberformat{\fontspec[Path = ./fonts/, Extension = .ttf]{SimHei}\zihao{5}}
\def\CTEX@subsubsection@indent{2\ccwd}
\def\CTEX@subsubsection@beforeskip{0ex}
\def\CTEX@subsubsection@afterskip{0ex}
\renewcommand{\thesubsubsection}{\arabic{subsubsection}.}


\@ifclasslater{ctexbook}{2011/03/13}
{%
    \ctexset{
        % chapter/fixskip = true,
        contentsname={目\quad 录}
    }
}
{%
    \def\CTEX@contentsname{目\quad 录}
}%

\RequirePackage{textcomp}
\RequirePackage{gensymb}

%============================ 一些章节的配置文件 =========%

% 目录设置，图片

\RequirePackage{subfig}
% 修复上面的冲突
\RequirePackage[titles,subfigure]{tocloft}


%============================ 我自己用的一些小命令 =========%
%
% 针对那些使用mendeley这一类软件的，直接复制（导出）过来的参考文献，可以在参考文献处点击跳转到文献所在网址
\providecommand \doibase [0]{http://dx.doi.org/}%

% 正文中有些下角标等公式，我们并不想让它斜体，公式不斜体:如 \eqrm{MoS_2}
\newcommand{\eqrm}[1]{
    $\rm #1 $
}

% 表格文字居中，其实就是相当于表格合并
% 用法 \tabincell{c}{物理//量//单位}
\newcommand{\tabincell}[2]{ \begin{tabular}{ #1 } #2 \end{tabular}}


% 物理单位埃，已经加了 $ $， 不要再放在$$环境里面
\newcommand{\angstrom}{
    $\mathring{\text{A}}$
}

% \makebox[0pt][l]{$\square$}\raisebox{.15ex}{\hspace{0.1em}$\checkmark$}
% \mbox{\ooalign{$\checkmark$\cr\hidewidth$\square$\hidewidth\cr}}

\newcommand{\done}{\makebox[0pt][l]{$\square$}\raisebox{.15ex}{\hspace{0.1em}$\checkmark$}}

%============================ 我自己用的一些小命令 =========%

\RequirePackage{textcomp}%摄氏度


%%=======page
% 页面边距
% 页边距为上2.5cm，下2.5cm，左2.5cm，右2cm，页眉边距为1.5cm，页脚边距为1.5cm。行间距为固定值20磅。
% https://github.com/yuhldr/LZUThesis2020/issues/21
%%=======page
\RequirePackage[top=2.5cm, bottom=2.5cm,outer=2cm, inner=2.5cm, headheight=1cm, footskip=1cm, heightrounded]{geometry}


%=======package
%代码风格设置
%=======package
\RequirePackage{listings}

\renewcommand{\lstlistingname}{源代码}

\lstset{
    breaklines=true, %对过长的代码自动换行
    columns=fixed,
    numbers=left,                                        % 在左侧显示行号
    frame=none,                                          % 不显示背景边框
    backgroundcolor=\color[RGB]{255,255,255},            % 设定背景颜色
    keywordstyle=\color[RGB]{40,40,255},                 % 设定关键字颜色
    numberstyle=\tiny\itshape\color{gray},
    commentstyle=\em\color[RGB]{0,96,96},                % 设置代码注释的格式
    stringstyle=\em\color[RGB]{128,0,0},   % 设置字符串格式
    showstringspaces=false,                              % 不显示字符串中的空格
    language=tex,
    alsolanguage=[ANSI]C, %可以添加很多个alsolanguage,如alsolanguage=matlab,alsolanguage=VHDL等
    alsolanguage=python,
    alsolanguage=java,
    alsolanguage=XML,
    alsolanguage=c++,
    alsolanguage=matlab,
    basicstyle=\fontfamily{ptm}\selectfont\songti\scriptsize, % <- 关键修改处
    upquote=true,       % 修正引号显示
    tabsize=4,          % 设置缩进为4个空格
    xleftmargin=2em,    % 左边距对齐行号
    escapeinside=``,    % 允许在代码中使用中文注释
    columns=fullflexible, % 重要：允许中文字符自动调整
    keepspaces=true % 保持空格对齐
}


%=======package
% 数学宏包
% 图像宏包
% 颜色宏包
% 字体宏包
%=======package
\RequirePackage{amsmath}
% \RequirePackage{amsfonts}
% \RequirePackage{amssymb}
\RequirePackage{mathrsfs}
\RequirePackage{amssymb}
\RequirePackage{graphicx}
\graphicspath{{figures/}{figure/}{pictures/}
        {picture/}{pic/}{pics/}{image/}{images/}}
\RequirePackage[svgnames]{xcolor}


% start ------------ 英文字体（含公式、正文）、加粗、斜体  -------------- start

% 方案一

% \RequirePackage{mathptmx, bm}
% \RequirePackage{bm, mathptmx}

% mathptmx 可以让英文字体（包含公式和正文）为：Times New Roman
% 但是 mathptmx 会导致花体，mathcal和mathscr完全相同，正常mathcal会花的轻一些
% 而且 mathptmx 还会导致boldsymbol 加粗失效
% bm 可以让 boldsymbol 加粗再生效
% 但是需要注意的是，bm 放在前面和后面完全不一样
% bm 放在前面会导致 加粗只是 “描粗” 了的感觉
% bm 放在后面会导致 加粗以后字形变宽，希腊字母相比加粗前有些变形


% 方案二
\RequirePackage{mathptmx}
\RequirePackage{newtxtext}
% \RequirePackage{newtxmath}
% 如果觉得上面的不合适，也可以使用 newtxmath，效果略有不同
% 但是问题是，如果只 newtxmath 的话，正文英文字体是不对的，所以也需要 mathptmx

% 最后注意，newtxmath 与 bm 有冲突
% 使用方法详见 `template.tex` 搜索 `boldsymbol`

% end ------------ 英文字体（含公式、正文）、加粗、斜体  -------------- end

\RequirePackage{fontspec} %用电脑上自带的字体

\RequirePackage{float}%控制图片位置 参数H
\RequirePackage[T1]{fontenc}

\RequirePackage{booktabs}
\RequirePackage{harpoon}

\RequirePackage{tablefootnote}
% 可以换页的表格
\RequirePackage{longtable}

% 调整 longtable 前后的垂直间距
\setlength{\LTpre}{0pt}     % 表格前的间距
\setlength{\LTpost}{0pt}    % 表格后的间距

\RequirePackage{multirow}
\RequirePackage{threeparttable}
\RequirePackage{booktabs}
\RequirePackage{fmtcount}
\RequirePackage{array}

% 3.图或表的目录。图和表应有序号，序号与名称之间空1个字符间隙，并与正文保持一致。“图/表目录”三个字字体为黑体，三号，居中；标题字体为宋体，四号，如“图1.1本科生总体数据分析”。标题文字居左，页码居右，之间用连续点连接。
% 图表目录编号头
\newcommand{\figlabel}{图}
\newcommand{\tbllabel}{表}

\renewcommand{\cfttabpagefont}{\fontspec[Path = ./fonts/, Extension = .ttc]{SimSun}}
\renewcommand{\cftfigpagefont}{\fontspec[Path = ./fonts/, Extension = .ttc]{SimSun}}
\renewcommand{\cfttabfont}{\CJKfontspec[Path = ./fonts/, Extension = .ttc]{SimSun}\zihao{4}}
\renewcommand{\cftfigfont}{\CJKfontspec[Path = ./fonts/, Extension = .ttc]{SimSun}\zihao{4}}

% 自定义目录
\newcommand{\customcontent}{

    \clearpage
    {
        \pagestyle{empty}
        \fancypagestyle{plain}
        {
            \fancyhf{}
            \renewcommand{\headrulewidth}{0pt}
            \renewcommand{\footrulewidth}{0pt}
        }
        \addtocontents{toc}{\protect\thispagestyle{empty}}
        \tableofcontents
        \thispagestyle{empty}


        % 图表目录标题
        \CTEXoptions[listfigurename={图\quad 目\quad 录}]
        \CTEXoptions[listtablename={表\quad 目\quad 录}]

        % 插图目录
        \clearpage
        \setlength{\cftfigindent}{0pt}          % 取消左侧缩进
        \setlength{\cftfignumwidth}{3.5em}       % 设置编号框宽度
        \renewcommand{\numberline}[1]{\figlabel~##1\hspace*{0.5em}}
        \setlength{\cftbeforefigskip}{0pt}     % 条目间固定间距
        \renewcommand{\cftfigpresnum}{}         % 清除章节前缀干扰
        \makeatletter
        \renewcommand{\addvspace}[1]{}          % 禁用自动添加的章节间距
        \makeatother
        \listoffigures
        \thispagestyle{empty}

        % 表格目录
        \clearpage
        \setlength{\cfttabindent}{0pt}          % 取消左侧缩进
        \setlength{\cfttabnumwidth}{3.5em}      % 设置编号框宽度
        \renewcommand{\numberline}[1]{\tbllabel~##1\hspace*{0.5em}}
        \setlength{\cftbeforetabskip}{0pt}     % 条目间固定间距
        \renewcommand{\cftfigpresnum}{}         % 清除章节前缀干扰
        \makeatletter
        \renewcommand{\addvspace}[1]{}          % 禁用自动添加的章节间距
        \makeatother
        \listoftables
        \thispagestyle{empty}
    }

}


%=======head and foot
% 页眉页脚
% 1.页眉。“兰州大学本科毕业论文（设计）”字居左排，毕业论文（设计）题目居右排，字体为宋体，小五号；页眉与正文之间用下划线分隔。
% 2.页码。页脚居中排，字体为宋体，五号。封面、目录不编排页码，中英文摘要页用罗马数字单独连续编号，引言、正文用阿拉伯数字连续编号，附录可不编排页码。
%=======head and foot
\RequirePackage{fancyhdr}  % Needed to define custom headers/footers
\RequirePackage{lastpage}  % Number of pages in the document
\RequirePackage{etoolbox}
\pagestyle{fancy}          % Enables the custom headers/footers


\fancypagestyle{frontmatterstyle}{
    \fancyhf{}
    \renewcommand{\headrulewidth}{0pt}

    \fancyfoot{} % clear all footer fields
    \cfoot[C]{\zihao{5}\fontspec[Path = ./fonts/, Extension = .ttc]{SimSun}\thepage} %
    \renewcommand{\thepage}{\Roman{page}}
}
\appto\frontmatter{\pagestyle{frontmatterstyle}}

\DeclareOption{doublelines}{
    \def\LZU@doublelines {}
}
\ProcessOptions\relax

\fancypagestyle{mainmatterstyle}{
    \fancyhf{}
    \lhead{\zihao{-5}兰州大学本科毕业论文（设计）}%
    \rhead{\zihao{-5}\@title}
    % Footers
    \fancyfoot{} % clear all footer fields
    % 页码。页脚居中排，字体为宋体，五号。封面、目录不编排页码，中英文摘要页用罗马数字单独连续编号，引言、正文用阿拉伯数字连续编号，附录可不编排页码
    \cfoot[C]{\zihao{5}\fontspec[Path = ./fonts/, Extension = .ttc]{SimSun}\thepage}
    \renewcommand\headrule{ \kern 0.8pt \hrule width \hsize height 0.3pt}
}

\appto\mainmatter{\pagestyle{mainmatterstyle}}
\appto\mainmatter{\linespread{1.3889}\selectfont}   %行距
\fancypagestyle{plain}{
    \thispagestyle{mainmatterstyle}
}


%=======format
% 标题样式
%=======format

% 1.“目录”两字间空1个字符间隙，字体为黑体，三号，加粗，居中，单倍行距，段前24磅，段后18磅；目录中标题不能超过三级，
% 一级标题字体为宋体，四号，加粗；
% 二级标题字体为宋体，四号；
% 三级标题字体为宋体，小四号。

\RequirePackage[font=small]{caption}

\RequirePackage[titles]{tocloft}
\renewcommand\cftchapdotsep{0.5}                %虚线间隔
\renewcommand\cftdotsep{0.5}                    %虚线间隔
\setlength{\cftbeforesecskip}{0pt}              %章节间隔 ，节前6磅

\setlength{\cftbeforechapskip}{0pt}
\setlength{\cftbeforesubsecskip}{0pt}

\renewcommand\cftchapfont{\zihao{4}\fontspec[Path = ./fonts/, Extension = .ttc]{SimSun}\bfseries}  % 目录中一级标题，应该是加粗（宋体加粗）
\renewcommand\cftsecfont{\zihao{4}\fontspec[Path = ./fonts/, Extension = .ttc]{SimSun}}
\renewcommand\cftsubsecfont{\zihao{-4}\fontspec[Path = ./fonts/, Extension = .ttc]{SimSun}}
\renewcommand\cftchappagefont{\fontspec[Path = ./fonts/, Extension = .ttc]{SimSun}\mdseries}
\renewcommand\cftsecpagefont{\fontspec[Path = ./fonts/, Extension = .ttc]{SimSun}}
\renewcommand\cftsubsecpagefont{\fontspec[Path = ./fonts/, Extension = .ttc]{SimSun}}

\setlength{\cftbeforetoctitleskip}{0pt}
\setlength{\cftaftertoctitleskip}{18pt}


%%=======information
%（一）封面
% 1. 毕业论文（设计）题目。简明扼要，核心内容明确。中文题目一般不超过25个字，字体为宋体，三号；英文题目一般不超过150个字母，字体为Times New Roman，三号。根据论文内容，可以加副标题。
% 2.学生姓名、指导教师、学院、专业、年级字体为宋体，三号。
%
%%=======information
\newtoks\advisor
\newtoks\college
\newtoks\major
\newtoks\grade
\newtoks\titlextra %标题多余一行时添加
%=======english title
\newtoks\entitle
\newtoks\entitletra %标题多余一行时添加
%%=======statement
% 标题页
% 需要添加循环函数，判定多于一行的情况
%%=======statement

\RequirePackage{array}
\def\LZU@underline[#1]#2{%
    \underline{\hbox to #1{\hfill#2\hfill}}}
\def\LZUunderline{\@ifnextchar[\LZU@underline\underline}

\RequirePackage{makecell}
% \RequirePackage{pgffor}
\RequirePackage{forloop}
\RequirePackage{xstring}
\renewcommand\maketitle{%
    \cleardoublepage
    \thispagestyle{empty}
    \begin{center}
        \includegraphics[width=6cm]{lzu2020.pdf}\\
        \vspace*{21.8pt}

        {\zihao{1}\bfseries\songti{本科毕业论文（设计）\\}}% 封面这几个字，规范中未提及，此处按照宋体
        \vspace{21.8pt}
        \par
        \zihao{4}
        \def\tabcolsep{6pt}
        \expandarg
        \newcounter{title_str_number}
        \vspace*{60pt}

        \begin{tabular}{ll}
            \songti\bfseries \zihao{3} 论文题目（中文）% “论文题目（中文）”这几个字，应该是加粗（宋体加粗）
            \forloop{title_str_number}{1}{\value{title_str_number}<6}{%
                \StrFindGroup{\@title}{\value{title_str_number}}[\mygroup]%
                \IfStrEq{\mygroup}{}{}{%
             & {\StrFindGroup{\@title}{\value{title_str_number}}[\mygroup]\LZUunderline[320pt]{ \songti \zihao{3}\mygroup}} \\[0.40cm]%
                }%
            }%
            \songti\bfseries  \zihao{3} 论文题目（英文）% “论文题目（英文）”这几个字，应该是加粗（宋体加粗）
            \forloop{title_str_number}{1}{\value{title_str_number}<6}{%
                \StrFindGroup{\the\entitle}{\value{title_str_number}}[\mygroup]%
                \IfStrEq{\mygroup}{}{}{%
             & {\StrFindGroup{\the\entitle}{\value{title_str_number}}[\mygroup]\LZUunderline[320pt]{\zihao{3}\mygroup}}     \\[0.40cm]%
                }%
            }%
        \end{tabular}

        \vspace*{60pt}

        \begin{tabular}{cc}
            {\songti \zihao{3}{学生姓名}}       &
            {\LZUunderline[180pt]{ \songti\fontspec[Path = ./fonts/, Extension = .ttc]{SimSun} \zihao{3}\@author}}       \\[0.40cm]
            {\songti \zihao{3}{指导教师}}       &
            {\LZUunderline[180pt]{ \songti\fontspec[Path = ./fonts/, Extension = .ttc]{SimSun} \zihao{3}  \the\advisor}} \\[0.40cm]
            {\songti \zihao{3}{学\qquad 院}}  &
            {\LZUunderline[180pt]{ \songti  \zihao{3} \the\college}} \\[0.40cm]
            {\songti \zihao{3} {专\hfill 业}} &
            {\LZUunderline[180pt]{ \songti  \zihao{3} \the\major}}   \\[0.40cm]
            {\songti \zihao{3}{年\qquad 级}}  &
            {\LZUunderline[180pt]{ \songti\fontspec[
                Path = ./fonts/,  % 字体文件所在的目录
                Extension = .ttc, % 字体文件扩展名
            ]{SimSun} \zihao{3}  \the\grade}}   \\[0.40cm]
        \end{tabular}
        \par
        \vspace{40pt}
        {\ziju{0}\zihao{3} \heiti{兰州大学教务处}}
    \end{center}
    \clearpage
}



\newtoks \teachertime
\newtoks \mysignature
\newtoks \mytime
\newtoks \teachersignature

\newcommand\makestatement{
    \newcommand\fifth{0.2\textwidth}
    \newcommand\middlespace{0.08\textwidth}
    \newcommand\largespace{0.26\textwidth}

    \thispagestyle{empty}
    %\cleardoublepage
    \baselineskip 22.5pt
    \parskip 0pt

    \begin{center}
        {\bfseries\songti\zihao{3}{诚信责任书}} % “诚信责任书”这几个字，应该是加粗（宋体加粗）
    \end{center}

    本人郑重声明：本人所呈交的毕业论文（设计），是在导师的指导下独立进行研究所取得的成果。毕业论文（设计）中凡引用他人已经发表或未发表的成果、数据、观点等，均已明确注明出处。除文中已经注明引用的内容外，不包含任何其他个人、集体已经发表或未发表的论文。

    本声明的法律责任由本人承担。


    \vskip1.5cm

    \begin{center}
        \begin{tabular*}{\textwidth}{rlcrl}
            论文作者签名 ：&\LZUunderline[0.15\textwidth]{\the\mysignature} & \hspace{\largespace} & 日\quad 期：&\LZUunderline[0.15\textwidth]{\the \mytime}
        \end{tabular*}
    \end{center}

    \vskip1.0cm

    \begin{center}
        {\bfseries\songti\zihao{3}{关于毕业论文（设计）使用授权的声明}}% “关于毕业论文（设计）使用授权的声明”这几个字，应该是加粗（宋体加粗）
    \end{center}

    本人在导师指导下所完成的论文及相关的职务作品，知识产权归属兰州大学。本人完全了解兰州大学有关保存、使用毕业论文（设计）的规定，同意学校保存或向国家有关部门或机构送交论文的纸质版和电子版，允许论文被查阅和借阅；本人授权兰州大学可以将本毕业论文（设计）的全部或部分内容编入有关数据库进行检索，可以采用任何复制手段保存和汇编本毕业论文（设计）。本人离校后发表、使用毕业论文（设计）或与该毕业论文（设计）直接相关的学术论文或成果时，第一署名单位仍然为兰州大学。

    本毕业论文（设计）研究内容：

    % 如果不能公开，请把下面这两个置换    \done   $\square$
    \done 可以公开

    $\square$  不宜公开，已在学位办公室办理保密申请，解密后适用本授权书。

    （请在以上选项内选择其中一项打“\surd ”）

    \vskip1.5cm
    \begin{center}
        \begin{tabular*}{\textwidth}{rlcrl}
            论文作者签名 ：&\LZUunderline[0.25\textwidth]{\the\mysignature} & \hspace{\middlespace} &  导师签名 ：&\LZUunderline[\fifth]{\the\teachersignature} \\
            \quad\\
            日\qquad \qquad 期：&\LZUunderline[0.25\textwidth]{\the \mytime} & \hspace{\middlespace} & 日\qquad 期：&\LZUunderline[\fifth]{\the\teachertime}
        \end{tabular*}
    \end{center}
    \clearpage
}


%---------------------------
%论文成绩
%---------------------------
\RequirePackage{tabularx}
\newtoks \supervisorcomment
\newtoks \recommendedgrade
\newtoks \supervisorsignature
\newtoks \committeesignature
\newtoks \committeecomment
\newtoks \outstandingcommitteesignature
\newtoks \outstandingcommitteecomment
\newtoks \finalgrade
\newcommand{\Grade}{
    \clearpage
    % \thispagestyle{empty}
    % \phantomsection
    % \addcontentsline{toc}{chapter}{毕业论文（设计）成绩}
    \fancyfoot{}           % 清除页脚（去掉页码）
    \vspace{-\baselineskip}
    \begin{center}
        \zihao{-3}\songti  % 成绩这一页整体设置，应该是加粗（宋体加粗）
        \begin{tabularx}{\textwidth}{|X|}
            \multicolumn{1}{c}{
                \zihao{3} \bfseries\heiti{毕业论文（设计）成绩表}
            }                                                                                                   \\
            \multicolumn{1}{c}{}                                                                                \\
            \hline
            导师评语                                                                                                \\%
            \centerline{%
            \begin{minipage}[t][8cm][t]{0.95\textwidth}
                    \setlength\parindent{\ccwd}
                    \zihao{-4}  \the \supervisorcomment
                \end{minipage}}                                                         \\
            \zihao{4}\bfseries{建议成绩}\LZUunderline[80pt]{\the \recommendedgrade}
            \hfill
            \bfseries{指导教师（签字）}\LZUunderline[80pt]{
                \the \supervisorsignature
            }                                                                                                   \\
            \hline
            \bfseries{答辩委员会意见}                                                                                  \\
            \centerline{%
                \begin{minipage}[t][1.5cm][t]{0.95\textwidth}
                    \setlength\parindent{\ccwd}
                    \zihao{-4} \the\committeecomment
                \end{minipage}
            }
            \hfill \bfseries{答辩委员会负责人（签字）}\LZUunderline[80pt]{\the \committeesignature}                                             \\
            \hline
            \\[2.3cm]
            \bfseries{成绩}\LZUunderline[80pt]{\the \finalgrade}\hfill \bfseries{学院（盖章）}\underline{\hspace{80pt}} \\
            \hfill{\zihao{-4}\bfseries{年}\hspace{20pt}\bfseries{月}\hspace{20pt}\bfseries{日}}                    \\
            \hline
        \end{tabularx}
    \end{center}
}

\newcommand{\OutstandingGrade}{
    \clearpage
    % \thispagestyle{empty}
    % \phantomsection
    % \addcontentsline{toc}{chapter}{毕业论文（设计）成绩}
    \fancyfoot{}           % 清除页脚（去掉页码）
    \vspace{-\baselineskip}
    \begin{center}
        \zihao{-3}\songti  % 成绩这一页整体设置，应该是加粗（宋体加粗）
        \begin{tabularx}{\textwidth}{|X|}
            \multicolumn{1}{c}{
                \zihao{3} \bfseries\heiti{毕业论文（设计）成绩表}
            }                                                                                                   \\
            \multicolumn{1}{c}{}                                                                                \\
            \hline
            导师评语                                                                                                \\%
            \centerline{%
            \begin{minipage}[t][8cm][t]{0.95\textwidth}
                    \setlength\parindent{\ccwd}
                    \zihao{-4}  \the \supervisorcomment
                \end{minipage}}                                                         \\
            \zihao{4}\bfseries{建议成绩}\LZUunderline[80pt]{\the \recommendedgrade}
            \hfill
            \bfseries{指导教师（签字）}\LZUunderline[80pt]{
                \the \supervisorsignature
            }                                                                                                   \\
            \hline
            \bfseries{答辩委员会意见}                                                                                  \\
            \centerline{%
                \begin{minipage}[t][3.5cm][t]{0.95\textwidth}
                    \setlength\parindent{\ccwd}
                    \zihao{-4} \the\outstandingcommitteecomment
                \end{minipage}
            }
            \hfill \bfseries{答辩委员会负责人（签字）}\LZUunderline[80pt]{\the \outstandingcommitteesignature}                                             \\
            \hline
            \\[2.3cm]
            \bfseries{成绩}\LZUunderline[80pt]{\the \finalgrade}\hfill \bfseries{学院（盖章）}\underline{\hspace{80pt}} \\
            \hfill{\zihao{-4}\bfseries{年}\hspace{20pt}\bfseries{月}\hspace{20pt}\bfseries{日}}                    \\
            \hline
        \end{tabularx}
    \end{center}
}

%=======abstract
% 摘要页
%
%=======abstract

% 2.中英文关键词。毕业论文（设计）中应列出3～8个关键词，关键词与摘要之间空1行，置于摘要之后。中文关键词字体为宋体，小四号，加粗置顶格；英文关键词含义与中文关键词须一致。“关键词”为“Keywords”，字体为Times New Roman，小四号，加粗，置顶格。

% 中文摘要以300-400字为宜。毕业论文（设计）题目字体为宋体，二号，加粗，段前24磅，段后18磅；“中文摘要”居中，字体为黑体，三号；摘要正文字体为宋体，小四号。行间距为固定值20磅。
\newcommand{\ZhAbstract}[2]{%
\clearpage
\phantomsection
\addcontentsline{toc}{chapter}{中文摘要}
\thispagestyle{frontmatterstyle}
\begin{center}%
    \setlength{\parskip}{24pt}
    \begin{minipage}{0.8\textwidth}
        \linespread{1.3889}
        \centering
        % 中文摘要标题，应该是加粗（宋体加粗）
        \zihao{2}\bfseries\songti \noindent\@title\the\titlextra
    \end{minipage}
\end{center}%
\begin{center}%
    \linespread{1}
    \setlength{\parskip}{18pt}
    \zihao{3}\heiti  中文摘要
\end{center}%
% 行距20磅 http://blog.sina.com.cn/s/blog_5e16f1770100ly96.html
\setlength{\baselineskip}{20pt}
\selectfont
\setlength{\parskip}{0pt}
\vspace{10pt}
\par #1\\%
\vbox{}\\
% 关键词这几个字，应该是加粗（宋体加粗）
{\songti\bfseries 关键词：} #2
}

% 英文摘要实际单词在300个左右，应与中文摘要内容一致。毕业论文（设计）英文题目字体为Times New Roman，二号，段前24磅，段后18磅；“英文摘要”为“Abstract”，字体为Arial，三号，加粗居中；英文摘要正文每段开头空4个字符间隙，字体为Times New Roman，小四号。行间距为固定值20磅。
\newcommand{\EnAbstract}[2]{%
\clearpage
\phantomsection
\addcontentsline{toc}{chapter}{英文摘要}
\thispagestyle{frontmatterstyle}
\begin{center}%
    \setlength{\parskip}{24pt}
    \begin{minipage}{0.8\textwidth}
        \linespread{1}
        \selectfont
        \centering
        \zihao{2} \bfseries \noindent \expandafter\expandafter{\the\entitle\ \the\entitletra}%
    \end{minipage}
\end{center}%
\begin{center}%
    \linespread{1}
    \selectfont
    \setlength{\parskip}{18pt}
    %Linux没有这个字体，需要自己安装，或者自定义命令
    \zihao{3}\fontspec[
        Path = ./fonts/,  % 字体文件所在的目录
        Extension = .ttf, % 字体文件扩展名
    ]{Arialbd}\bfseries Abstract
\end{center}%
\setlength{\parskip}{0pt}
\setlength{\baselineskip}{20pt} %行距20磅
\selectfont
\vspace{11pt}
\par #1\\%
\vbox{}\\
{\bfseries Keywords:} #2
}



%=======appendix
%附录页和感谢页
%
%=======appendix

% 附录中的插图、表格、公式、参考文献等的序号需与正文区分，另行编制，如编为“图1”、“表1”、“式（1）”、“文献[1]”等。“附录”两字间空2个汉字间隙，三号字，黑体，加粗，居中，单倍行距，段前24磅，段后18磅。附录的内容为宋体，五号（英文用Times New Roman体，10.5磅），行间距为固定值20磅。
% \newcommand{\Appendix}{%
%     \cleardoublepage
%     \phantomsection
%     \setcounter{section}{0}
%     \setcounter{chapter}{\numexpr\value{chapter}+1} % 自动计算章节数+1
%     \renewcommand{\thechapter}{A}%
%     \addcontentsline{toc}{chapter}{\texorpdfstring{附 \qquad 录}{附录}}
%     \chapter*{\texorpdfstring{附 \qquad 录}{附录}}
%     \zihao{5}
%     \setlength{\parindent}{2em}
% }

\newcommand{\Appendix}{%
    \cleardoublepage
    \phantomsection
    \@ifundefined{appendixflag}{%
        \appendix % 进入附录模式
        \renewcommand{\thechapter}{\Alph{chapter}} % 字母编号
        \setcounter{chapter}{0} % 重置计数器从0开始
        \gdef\appendixflag{} % 设置进入附录标志
    }{}
    \stepcounter{chapter} % 自动递增计数器
    \addcontentsline{toc}{chapter}{\texorpdfstring{附 \qquad 录}{附录}} % 动态目录项
    \chapter*{\texorpdfstring{附 \qquad 录}{附录}} % 带独立编号的标题
    \zihao{5}
    \setlength{\parindent}{2em}
}

% “致谢”两字间空2个字符间隙，字体为黑体，三号字，加粗居中。单倍行距，段前24磅，段后18磅。正文部分首行缩进两个汉字符，小四号字，仿宋，行距20磅。

\newcommand{\Thanks}{%
    \cleardoublepage
    \phantomsection
    \addcontentsline{toc}{chapter}{\texorpdfstring{致\qquad 谢}{致谢}}
    \chapter*{\texorpdfstring{致\qquad 谢}{致谢}}
    \zihao{-4}\fangsong\fontspec[
        Path = ./fonts/,  % 字体文件所在的目录
        Extension = .ttf, % 字体文件扩展名
    ]{SimFang}
    \setlength{\parindent}{2em}
}


\newcommand{\Intro}{%
    \cleardoublepage
    \phantomsection
    \addcontentsline{toc}{chapter}{\texorpdfstring{引 \quad 言}{引言}}
    \chapter*{\texorpdfstring{引 \quad 言}{引言}}
    \setcounter{section}{0}
    \setcounter{chapter}{0}
    \zihao{-4}\songti

}

%---------------------------
%超链接
%---------------------------
\RequirePackage[unicode,psdextra]{hyperref} % Required for hyperlinks
\hypersetup{hidelinks,breaklinks=true,bookmarksopen=false}
%自动写入pdf信息
\AtBeginDocument{
    \hypersetup{
        pdftitle = {\@title},
        pdfauthor = {\@author},
        pdfsubject = {兰州大学本科毕业论文（设计）}
    }
}


\RequirePackage[nameinlink]{cleveref}
\crefformat{equation}{#2式(#1)#3}
\crefformat{figure}{#2图#1#3}
\crefformat{table}{#2表#1#3}
\crefformat{chapter}{#2第\zhnumber{#1}章#3}
\crefformat{section}{#2#1节#3}
\crefformat{subsection}{#2#1小节#3}
\crefformat{subsubsection}{#2#1小节#3}


%item style
\RequirePackage{enumitem}
\setenumerate[1]{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=5pt}
\setitemize[1]{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=0pt}
\setdescription{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=5pt}




%======%math theorem
% 英文名称改为汉字
%
%======%math theorem
\RequirePackage[amsmath,thmmarks,hyperref]{ntheorem}
\theorembodyfont{\rmfamily\songti}
\theoremheaderfont{\rmfamily\heiti}
\theoremsymbol{\ensuremath{\square}}
\newtheorem*{proof}{证明}
\theoremstyle{plain}
\theoremsymbol{}
\qedsymbol{\ensuremath{\square}}
\newtheorem{assumption}{假设}[chapter]
\newtheorem{definition}{定义}[chapter]
\newtheorem{proposition}{命题}[chapter]
\newtheorem{lemma}{引理}[chapter]
\newtheorem{theorem}{定理}[chapter]
\newtheorem{axiom}{公理}[chapter]
\newtheorem{corollary}{推论}[chapter]
\newtheorem{example}{例}[chapter]
\newtheorem{conjecture}{猜想}[chapter]

\crefname{theorem}{定理}{定理}
\crefname{assumption}{假设}{假设}
\crefname{definition}{定义}{定义}
\crefname{proposition}{命题}{命题}
\crefname{lemma}{引理}{引理}
\crefname{theorem}{定理}{定理}
\crefname{axiom}{公理}{公理}
\crefname{corollary}{推论}{推论}
\crefname{example}{例}{例}
\crefname{remark}{注释}{注释}
\crefname{conjecture}{猜想}{猜想}



%---------------------------
%程序伪代码实现
%---------------------------
\RequirePackage{algorithm}
\RequirePackage{algpseudocode}
\floatname{algorithm}{算法}
\renewcommand{\algorithmicrequire}{\bfseries{输入:}}
\renewcommand{\algorithmicensure}{\bfseries{输出:}}


%改变图表的编号格式

% 图：图名置于图的下方，五号字，宋体，居中（英文用Times New Roman体10.5磅），单倍行距，段前6磅，段后12磅，图序与图名之间空1个汉字符。
% 表：表名置于表的上方，五号字，宋体，居中（英文用Times New Roman体10.5磅），单倍行距，段前6磅，段后6磅，表序与表名之间空1个汉字符。 
% 图和表下方的注释为五号字，宋体，居左（英文用Times New Roman体10.5磅），单倍行距。

\renewcommand{\thefigure}{\thechapter.\@arabic \c@figure}
\renewcommand{\thetable}{\thechapter.\@arabic \c@table}
\renewcommand{\theequation}{\thechapter.\@arabic \c@equation}

% 图序与图名之间空1个汉字符
\RequirePackage[labelsep=quad]{caption}

% 设置图的段前6磅，段后12磅
\captionsetup[figure]{aboveskip=6pt, belowskip=12pt}

% 设置表的段前6磅，段后6磅
\captionsetup[table]{aboveskip=6pt, belowskip=6pt}

% 设置图表标题样式
\captionsetup{
    font={small, singlespacing},  % 五号字(约small)，单倍行距
    font+=singlespacing,          % 确保单倍行距
    labelsep=quad,                % 标签与标题之间空1个汉字符
    skip=0pt                      % 覆盖默认的skip设置
}

% 设置图表注释样式
\captionsetup[figure]{font={small, singlespacing}, position=below, justification=raggedright}
\captionsetup[table]{font={small, singlespacing}, position=above, justification=raggedright}

% 4.公式。毕业论文（设计）中的公式应另起一行，并缩格书写。如有两个以上公式，应用从“1”开始的阿拉伯数字进行编号，并将编号置于括号内，如“（1）”。公式需要转行时，应尽可能在“＝”、“+”、“－”、“×”、“/”等记号处转行。编号及标题字体为宋体，五号。
% 设置公式编号的字体为宋体五号字

\makeatletter
\def\tagform@#1{%
  \maketag@@@{%
    \zihao{5}% 设置五号字（CTeX的字号命令）
    \fontspec[
        Path = ./fonts/,  % 字体文件所在的目录
        Extension = .ttc, % 字体文件扩展名
    ]{SimSun}% 显式指定宋体（确保中英文统一）
    (#1)% 添加括号（可选，如需去括号则删除）
  }%
}
\makeatother

%%=======%
%参考文献
%=======%
\newtoks\bibdatabase % 暂时不删除，防止不兼容之前的版本

%著录项目和著录格式遵照《信息与文献参考文献著录规则》（GB/T 7714－2015）的规定执行。
% https://github.com/hushidong/biblatex-gb7714-2015
% 其实严格来说gb7714-2015不应该设置gbnamefmt=lowercase，但是太多老师、学院觉得作者全大写丑
% 连续参考文献横杠连接
\RequirePackage{cite}
\newcommand{\newupcite}[1]{\textsuperscript{\cite{#1}}}
% \RequirePackage[backend=biber, style=gb7714-2015, gbnamefmt=lowercase]{biblatex}
% \addbibresource{bib/database.bib}
% \newcommand{\printbib}{
%     \zihao{5}
%     \setlength{\baselineskip}{16pt}
%     \cleardoublepage
%     \phantomsection
%     \addcontentsline{toc}{chapter}{参考文献}
%     \printbibliography
% }

% \renewcommand{\bibfont}{\zihao{5}}
% \setlength{\bibitemsep}{0ex}
% \setlength{\bibnamesep}{0ex}
% \setlength{\bibinitsep}{0ex}

\newcommand{\printbib}{
    \zihao{5}
    \setlength{\baselineskip}{16pt}
    \setlength{\parskip}{0pt}% 段落间距0
    \setlength{\itemsep}{0pt}% 列表项间距0
    \setlength{\parsep}{0pt}% 段落间距0
    \setlength{\partopsep}{0pt}% 部分顶部间距0
    \setlength{\topsep}{0pt}% 列表与上下文间距0
    \setlength{\parindent}{0pt}% 段落首行缩进0
    \setlength{\leftmargin}{0pt}% 左侧缩进0
    \setlength{\itemindent}{0pt}% 项目内容缩进0
    \bibliographystyle{bib/lzubib}
    \cleardoublepage
    \phantomsection
    \addcontentsline{toc}{chapter}{参考文献}
    \bibliography{\the \bibdatabase}
}


%修复url打乱引文格式问题，修改url字体使其符合文件规定
\urlstyle{rm}
\def\UrlBreaks{\do\A\do\B\do\C\do\D\do\E\do\F\do\G\do\H\do\I\do\J
    \do\K\do\L\do\M\do\N\do\O\do\P\do\Q\do\R\do\S\do\T\do\U\do\V
    \do\W\do\X\do\Y\do\Z\do\[\do\\\do\]\do\^\do\_\do\`\do\a\do\b
    \do\c\do\d\do\e\do\f\do\g\do\h\do\i\do\j\do\k\do\l\do\m\do\n
    \do\o\do\p\do\q\do\r\do\s\do\t\do\u\do\v\do\w\do\x\do\y\do\z
    \do\.\do\@\do\\\do\/\do\!\do\_\do\|\do\;\do\>\do\]\do\)\do\,
    \do\?\do\'\do+\do\=\do\#}

%=======footnote
%尾注
%=======footnote
\RequirePackage[perpage, bottom, flushmargin]{footmisc}
\RequirePackage{unicode-math}

\makeatletter
% 核心样式控制
\renewcommand{\thefootnote}{\symbol{\numexpr"245F+\value{footnote}}}
\renewcommand\@makefnmark{\textsuperscript{\@thefnmark}} % 正文编号上标
\renewcommand\@makefntext[1]{%
  \noindent
  \footnotesize
  \hspace*{2em}% 缩进基准线
  \normalfont\@thefnmark\hspace{0.5em}% 脚注内容常规显示
  \hangindent=3em\hangafter=1 % 悬挂缩进控制
  #1%
}

% 字体及行距设置
\renewcommand{\footnotesize}{\fontsize{9}{9}\selectfont}
\setlength{\footnotesep}{9pt}
\makeatother

\endinput
%%
%% End of file `LZUThesis.cls'.