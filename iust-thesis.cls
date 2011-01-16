%% This file is xepersian-thesis.cls (Modified version of report.cls)
%%
%% Copyright 2009 by Meisam Fathi Salmi (meisam_fathi@comp.iust.ac.ir)
%%
%% It may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3c
%% of this license or any later version.
%%
%% You are allowed to use, modify, and share this document.
%%
\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{iust-thesis}
              [2010/07/01 v0.2
 Thesis document class for Students of Iran University of Science and Technology]
\LoadClass[a4paper]{report}

\RequirePackage{fancyhdr}

\usepackage{hyperref}
\usepackage{graphicx}
\RequirePackage{rotating}

% show references in TOC
\usepackage[nottoc,notlot,notlof]{tocbibind}

% prepare the listing environment for typesetting code snippets
\usepackage{listings}
\lstset{language=[AspectJ]Java,  %setting language to Java/AspectJ
        basicstyle=\ttfamily\footnotesize, % setting the font to small and typewriter type
        keywordstyle=\textbf,
        frame=single, % setting the frame
        framerule=1pt, % setting the frame border thickness
        showstringspaces=false, % show spaces in their natural way
        xleftmargin= 20pt,%
        columns= fixed,% use fixed width fonts
        numbers=left, numberstyle=\footnotesize, stepnumber=1, numbersep=5pt % setting the line numbers
}
\RequirePackage{pgfplotstable}
\RequirePackage{tikz}
\usetikzlibrary{calc,through,backgrounds,positioning,fit,decorations.pathmorphing}

\RequirePackage[font=bf,
                     small,
                     labelformat=parens,
                     labelsep=colon,
                     skip=1pt,
%                      listformat=parens,
                     listfigurename=فهرست~شکل‌ها,
                     listtablename=فهرست~جدول‌ها,
                     tablename=جدول,
                     figurename=شکل]{caption}

\RequirePackage{xepersian}

%set page size and margins
\usepackage[a4paper,left=2.5cm,right=4cm,top=3cm,bottom=3cm]{geometry}

% set fonts
\settextfont[Scale=1.4]{Nazli}
\setdigitfont[Scale=1.4]{Nazli}
\setlatintextfont[Scale=1.2]{Times New Roman}

% set line spacing to 1.5
\def\linespace{2}
\renewcommand\baselinestretch{\linespace}
\setlength{\baselineskip}{6pt}

% set the skip space between paragraphs
\setlength{\parskip}{6pt}


\renewcommand\thesection{\arabic{section}-\thechapter}
\renewcommand\thesubsection{\arabic{subsection}-\thesection}
\renewcommand\thefigure{\arabic{figure}-\arabic{chapter}}
\renewcommand\thetable{\arabic{table}-\arabic{chapter}}

% set heading height
\setlength{\headheight}{15pt}

% add title, page number header for the TOC
\addtocontents{toc}{\textbf{ \quad \quad عنوان \hfill شماره‌ی صفحه}}
\addtocontents{lof}{\textbf{ \quad \quad عنوان \hfill شماره‌ی صفحه}}
\addtocontents{lot}{\textbf{ \quad \quad عنوان \hfill شماره‌ی صفحه}}

% add a line to toc
\addtocontents{toc}{}
\addtocontents{toc}{\protect\mbox{}\protect\hrulefill\par}
\addtocontents{lof}{}
\addtocontents{lof}{\protect\mbox{}\protect\hrulefill\par}
\addtocontents{lot}{}
\addtocontents{lot}{\protect\mbox{}\protect\hrulefill\par}

% My commands %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% for glosaary
\newcommand{\persiantoengentry}[2]{\indent \rl{#1} \dotfill \lr{#2} \newline}
\newcommand{\engtopersianentry}[2]{\indent \lr{#1} \dotfill \rl{#2} \newline}
\newcommand{\glossaryheadletter}[1]{\noindent \textbf{#1} \hfill \nopagebreak \newline \nopagebreak}
%for including code
\newcommand{\includecode}[1]{
\renewcommand{\baselinestretch}{1}
\begin{latin}
\lstinputlisting{#1}
\end{latin}
\renewcommand{\baselinestretch}{\linespace}
}

\renewcommand{\@makechapterhead}[1]{%
    \vspace*{100\p@}%
    \begin{center}
       \thispagestyle{empty}
	\ifnum \c@secnumdepth >\m@ne
	    \Huge\scshape \@chapapp\space \thechapter % Chapter number
	    \par\nobreak
	    \vspace{50pt}
	\fi
	\Huge \scshape #1\par                         % chapter title
	\ifnum \c@secnumdepth >\m@ne
	    \newpage
	    \mbox{}
	    \vspace{150pt}
	\fi
    \end{center}
  }

\renewcommand{\@makeschapterhead}[1]{%
    \vspace*{50\p@}%
    \begin{center}
	\ifnum \c@secnumdepth >\m@ne
	    \par\nobreak
	\fi
	\Huge \scshape #1\par                         % chapter title
    \end{center}
}

% The altertantive persian string for lists figs tables etc
\def\appendixname{\@ensure@RL{پیوست}}
\def\indexname{\@ensure@RL{نمایه}}
\def\refname{\@ensure@RL{مراجع}}
\def\abstractname{\@ensure@RL{چکیده}}
\def\partname{\@ensure@RL{بخش}}
\def\datename{\@ensure@RL{تاریخ:}}
\def\bibname{\@ensure@RL{مراجع}}
\def\chaptername{\@ensure@RL{فصل}}
\def\ccname{\@ensure@RL{رونوشت}}
\def\enclname{\@ensure@RL{پیوست}}
\def\pagename{\@ensure@RL{صفحه‌ی}}
\def\headtoname{\@ensure@RL{تقدیم به}}
\def\englishabstractname{\@ensure@RL{Abstract}}

% using caption package, these are absolutely redundant
% \def\figurename{\@ensure@RL{شکل}}
% \def\tablename{\@ensure@RL{جدول}}
\def\contentsname{\@ensure@RL{\centerline{فهرست~مطالب}}}
\def\listfigurename{\@ensure@RL{\centerline{فهرست~شکل‌ها}}}
\def\listtablename{\@ensure@RL{\centerline{فهرست~جدول‌ها}}}

\def\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}
\setlength\columnsep{10\p@}
\setlength\columnseprule{0\p@}


\def\shorttitle#1{\gdef\@shorttitle{#1}}
\def\studentnumber#1{\gdef\@studentnumber{#1}}

\def\university#1{\gdef\@university{#1}}
\def\department#1{\gdef\@department{#1}}
\def\degree#1{\gdef\@degree{#1}}
\def\city#1{\gdef\@city{#1}}

\def\major#1{\gdef\@major{#1}}
\def\field#1{\gdef\@field{#1}}

\def\thesisdate#1{\gdef\@thesisdate{#1}}
\def\defencedate#1{\gdef\@defencedate{#1}}

\def\supervisor#1{\gdef\@supervisor{#1}}
\def\supervisorlevel#1{\gdef\@supervisorlevel{#1}}

\def\examinora#1{\gdef\@examinora{#1}}
\def\examinoralevel#1{\gdef\@examinoralevel{#1}}
\def\examinorauniversity#1{\gdef\@examinorauniversity{#1}}

\def\examinorb#1{\gdef\@examinorb{#1}}
\def\examinorblevel#1{\gdef\@examinorblevel{#1}}
\def\examinorbuniversity#1{\gdef\@examinorbuniversity{#1}}

\def\examinorc#1{\gdef\@examinorc{#1}}
\def\examinorclevel#1{\gdef\@examinorclevel{#1}}
\def\examinorcuniversity#1{\gdef\@examinorcuniversity{#1}}

\def\englishtitle#1{\gdef\@englishtitle{#1}}
\def\englishauthor#1{\gdef\@englishauthor{#1}}
\def\englishdegree#1{\gdef\@englishdegree{#1}}
\def\englishdepartment#1{\gdef\@englishdepartment{#1}}
\def\englishfield#1{\gdef\@englishfield{#1}}
\def\englishmajor#1{\gdef\@englishmajor{#1}}
\def\englishthesisdate#1{\gdef\@englishthesisdate{#1}}
\def\englishsupervisor#1{\gdef\@englishsupervisor{#1}}
\def\englishcity#1{\gdef\@englishcity{#1}}
\def\englishuniversity#1{\gdef\@englishuniversity{#1}}

\newcommand\topagetext[1]{\gdef\@topagetext{#1}}
\newcommand\acknowledgementpagetext[1]{\gdef\@acknowledgementpagetext{#1}}
\newcommand\abstractpagetext[1]{\gdef\@abstractpagetext{#1}}
\newcommand\keywords[1]{\gdef\@keywords{#1}}
\newcommand\abstractpageenglishtext[1]{\gdef\@abstractpageenglishtext{#1}}
\newcommand\keywordsenglish[1]{\gdef\@keywordsenhlish{\lr{#1}}}


\def\acknowledgementname{قدردانی}
\def\writtenfor{پایان‌نامه برای دریافت درجه‌ی }
\def\infield{در رشته‌ی }
\def\inmajor{گرایش }
\def\undersupervision{استاد راهنما:}
\def\departmentof{دانشکده‌ی}
\def\universityof{دانشگاه}

\def\englishinfield{In~}
\def\englishinmajor{\lr{,}~}
\def\englishdepartmentof{Department of}
\def\englishby{BY:}
\def\englishwrittenfor{A Thesis Submitted in Partial Fulfillment of the Requirement for the
    Degree of}
\def\englishundersupervision{Supervisor:}

% creates all the front matter
\newcommand\frontmatter{
        \makepersiantitle
        \besmelahpage
        \copyrightpage
        \begin{topage}
                \@topagetext
        \end{topage}
        \begin{acknowledgementpage}
            \@acknowledgementpagetext
        \end{acknowledgementpage}
        \persianabstract
        \pagestyle{plain}
        \renewcommand\baselinestretch{1}
        \tableofcontents
        \listoffigures
        \listoftables
        \renewcommand\baselinestretch{\linespace}
        \newpage
        \pagenumbering{arabic}
        \pagestyle{fancy}
}

% Perisan title page
\newcommand\makepersiantitle{
        \begin{titlepage}
                \begin{center}
                        \includegraphics[scale=0.2]{logo}
                        \\
                        {\large\bf\departmentof\space\@department}
                        \par
                        \vskip 15mm
                        {\LARGE \bf \@title}\par
                        \vskip 1cm
                        {\large\bf\writtenfor \@degree
                        \par
                        \infield \@field \inmajor \@major}
                        \vskip 20mm
                        {\large\bf \@author}\par
                        \vskip 10mm
                        {\large
                          \undersupervision \\
                        \large\bf \@supervisor} \par
                        \vfill
                        {\large \@thesisdate}
                \end{center}
        \end{titlepage}%
}

% bemelah page (In The Name of the God)
\newcommand\besmelahpage{\newpage
        \thispagestyle{empty}
        \mbox{}
        \vskip 5cm
        \begin{center}
                \includegraphics[scale=0.75]{besmelah}
        \end{center}
}

% approvement
\newcommand\copyrightpage{
        \newpage
        \thispagestyle{empty}

        \begin{center}
                \begin{Large}        تأییدیه‌ی هیأت داوران جلسه‌ی دفاع از پایان‌نامه        \end{Large}
        \end{center}

        \vspace{36pt}

        \noindent
        \textbf{نام دانشكده:}
        \@department

        \noindent
        \textbf{نام دانشجو:}
        \@author

        \noindent
        \textbf{عنوان پایان‌نامه یا رساله:}
        \@title

        \noindent
        \textbf{تاریخ دفاع:}
        \@defencedate

        \noindent
        \textbf{رشته:}
        \@major

        \noindent
        \textbf{گرایش:}
        \@field

        \vspace{36pt}

        \begin{scriptsize}
        \begin{tabular}{|c|c|c|c|c|c|}
        \hline
        \textbf{ردیف}
        &
        \textbf{سمت}
        &
        \textbf{نام و نام خانوادگی}
        &
        \textbf{مرتبه دانشگاهی}
        &
        \textbf{دانشگاه}
        &
        \textbf{\hspace{24pt} امضا \hspace{24pt}}
        \\
        \hline
        & & & & &
        \\
        1
        &
        استاد راهنما
        &
        \@supervisor
        &
        \@supervisorlevel
        &
        \@university
        &
        \\
        & & & & &
        \\
        \hline
        & & & & &
        \\
        2
        &
        استاد مدعو خارجی
        &
        \@examinora
        &
        \@examinoralevel
        &
        \@examinorauniversity
        &
        \\
        & & & & &
        \\
        \hline
        & & & & &
        \\
        3
        &
        استاد مدعو داخلی
        &
        \@examinorb
        &
        \@examinorblevel
        &
        \@examinorbuniversity
        &
        \\
        & & & & &
        % \\
        % \hline
        % & & & & &
        % \\
        % 4
        % &
        % مسئول تحصیلات تکمیلی
        % &
        % \@examinorc
        % &
        % \@examinorclevel
        % &
        % \@examinorcuniversity
        % &
        % \\
        % & & & & &
        \\
        \hline
        \end{tabular}
        \end{scriptsize}

        \newpage
        \thispagestyle{empty}

        \begin{center}

        \begin{Large}
        تأییدیه‌ی صحت و اصالت نتایج
        \end{Large}


        \vspace{36pt}
        باسمه تعالی

        \end{center}

        \vspace{12pt}
        اینجانب
        \@author \
        به شماره دانشجویی
        \@studentnumber~
        دانشجوی رشته‌ی
        \@major \
        گرایش
        \@field \
        مقطع تحصیلی
        \@degree \
        تأیید می‌نمایم كه
        كلیه‌ی نتایج این پایان‌نامه حاصل كار اینجانب و بدون هرگونه دخل و تصرف است
        و موارد نسخه‌برداری‌شده از آثار دیگران را با ذكر كامل مشخصات منبع ذكر كرده‌ام.
        درصورت اثبات خلاف مندرجات فوق،
        به تشخیص دانشگاه مطابق با ضوابط و مقررات حاكم
        (قانون حمایت از حقوق مؤلفان و مصنفان و قانون ترجمه و تكثیر كتب و نشریات و آثار صوتی، ضوابط و مقررات آموزشی، پژوهشی و انضباطی ...)
        با اینجانب رفتار خواهد شد
        و حق هرگونه اعتراض درخصوص احقاق حقوق مكتسب و تشخیص و تعیین تخلف و مجازات را از خویش سلب می‌نمایم.
        در ضمن، مسؤولیت هرگونه پاسخگویی به اشخاص اعم از حقیقی و حقوقی و مراجع ذی‌صلاح
        (اعم از اداری و قضایی)
        به عهده‌ی اینجانب خواهد بود
        و
        دانشگاه هیچ‌گونه مسؤولیتی در این خصوص نخواهد داشت.

        \vspace{72pt}

        \hfill
        نام و نام خانوادگی:
        \@author

        \vspace{24pt}

        \hfill
        تاریخ و امضا:
        \hspace{96pt}

        \newpage
        \thispagestyle{empty}

        \begin{Large}
        \begin{center}
        مجوز بهره‌برداری از پایان‌نامه
        \end{center}
        \end{Large}

        \vspace{72pt}
        بهره‌برداری از این پایان‌نامه در چهارچوب مقررات كتابخانه و با توجه به محدودیتی كه توسط استاد راهنما به شرح زیر تعیین می‌شود، بلامانع است:

        \vspace{36pt}
        \fbox{\rule[0mm]{0cm}{6pt} }
        بهره‌برداری از این پایان‌نامه/ رساله برای همگان بلامانع است.

        \fbox{\rule[0mm]{0cm}{6pt} }
        بهره‌برداری از این پایان‌نامه/ رساله با اخذ مجوز از استاد راهنما، بلامانع است.

        \fbox{\rule[0mm]{0cm}{6pt} }
        بهره‌برداری از این پایان‌نامه/ رساله تا تاریخ .................................... ممنوع است.

        \vspace{72pt}
        \hfill
        نام استاد یا اساتید راهنما:
        \@supervisor

        \vspace{12pt}
        \hfill
        تاریخ:
        \hspace{96pt}

        \vspace{12pt}
        \hfill
        امضا:
        \hspace{96pt}
}

% to page(taghdim be ...)
\newenvironment{topage}{
        \newpage
        \thispagestyle{empty}
        \centerline{
                \huge \headtoname
        }
        \vspace{1cm}
        \par\noindent
}
{\newpage}


% acknowledgement page
\newenvironment{acknowledgementpage}{
        \newpage
        \thispagestyle{empty}
        \centerline{\Large \bf\acknowledgementname}
        \vspace{12pt}
}
{\newpage}

\newcommand\persianabstract
{
        \begin{abstract}
                \pagenumbering{alph}
                \@abstractpagetext
                \textbf{کلمات کلیدی:}  \@keywords
        \end{abstract}
}


% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% set the header style
\pagestyle{fancy}
\rhead{\@shorttitle}
\chead{}
\lhead{\leftmark}
\lfoot{}
\rfoot{}
\cfoot{\thepage}

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% % %  Back Matter
\newcommand\backmatter{
        %\printindex%[default][در این بخش نمایه‌ای از تمام لغاتی که در این پایان‌نامه به کار رفته‌اند مرتب شده بر اساس ترتیب حروف الفبا آمده است.]
        \label{appendix:index}
        \newpage
        \thispagestyle{empty}
        \begin{latin}
                \englishabstract
                \englishtitlepage
         \end{latin}
}

\newcommand\englishabstract{
        \newpage
         \thispagestyle{empty}
        \centerline{\Large \bf\englishabstractname}
        \vspace{1cm}
        \setlength{\baselineskip}{18pt}
        \@abstractpageenglishtext
        \renewcommand\baselinestretch{\linespace}
        \textbf{Keywords: }
        \@keywordsenhlish
}

% The english title page
\newcommand\englishtitlepage{
                \begin{center}
                        \renewcommand\baselinestretch{0.4}
                        \begin{titlepage}
                        \includegraphics[scale=0.2]{logoen}
                        \\
                        {\large\bf \@englishuniversity \\
                        \englishdepartmentof\space\@englishdepartment}
                        \par
                        \vskip 15mm
                        {\huge\bf \@englishtitle}\par
                        \vskip 1cm
                        {\large\bf\englishwrittenfor~\@englishdegree \\
                        \englishinfield \@englishfield \englishinmajor \@englishmajor}
                        \vskip 30mm
                        {\large\bf \englishby \\ \@englishauthor}\par
                        \vskip 15mm
                        {\large
                          \englishundersupervision \\
                        \bf\@englishsupervisor} \par
                        \vfill
                        {\large \@englishthesisdate}
                        \renewcommand\baselinestretch{\linespace}
                \end{titlepage}%
            \end{center}
}

\endinput