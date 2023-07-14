%%
%%
%%
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{ewhacse}
              [2023/07/14 v1.0 EWHA CSE document class (Unofficial)]

% \documentclass에 대한 옵션 필드 설정
% Usage: \documentclass[degree]{class_file_name}
% degree는 두 가지 선택가능 master, doctor
\newif\if@Doctor
\DeclareOption{doctor} {\@Doctortrue}
\DeclareOption{master} {\@Doctorfalse}

% korean... 설정 된 경우 국문 논문임.
\newif\if@Korean
\DeclareOption{korean} {\@Koreantrue}
\DeclareOption{english} {\@Koreanfalse}


\DeclareOption{leqno}  {\PassOptionsToClass{leqno}  {report}}
\DeclareOption{fleqn}  {\PassOptionsToClass{fleqn}  {report}}
\DeclareOption{openbib}{\PassOptionsToClass{openbib}{report}}

\ExecuteOptions{doctor}
\ProcessOptions

% base class: report class 사용
% report class에 대한 설명은 latex 관련 book에서 참고가능
\LoadClass[10.5pt,b5paper,onecolumn,oneside]{report}

\usepackage{epsfig}
\usepackage{amssymb}
\usepackage{amsmath}
\usepackage{amsfonts}
\usepackage{ifthen}
\usepackage{times}
\usepackage{chngpage}
\usepackage{subcaption}
\usepackage[titles]{tocloft}
\usepackage{tocloft}
\usepackage{sectsty}
\usepackage{titlesec}
\usepackage{indentfirst}
\usepackage{lscape} % for adding landscape page
\usepackage{lipsum}% Just for this example
\usepackage{notoccite}

\if@Korean
	\usepackage{tocloft}
	\usepackage[hangul]{kotex}
\else
    \usepackage{kotex}
\fi

\setmainfont{Times New Roman}
\setmainhangulfont[AutoFakeBold=2.0]{HMFMM.ttf}
\usepackage{fontspec}

\setlength{\paperwidth}  {210mm}
\setlength{\paperheight} {297mm}

% 페이지여백 설정
\addtolength{\hoffset}  {-1 in}
\addtolength{\voffset}  {-1 in}
\setlength{\topmargin}  {35mm}
\setlength{\headheight} {15mm}
\setlength{\headsep}    {0mm}

\setlength{\marginparwidth} {0mm}
\setlength{\marginparsep}   {0mm}

\setlength{\evensidemargin}  {35mm}
\setlength{\oddsidemargin}  {35mm}
\setlength{\textwidth}      {140mm}
\setlength{\textheight} {195mm}
\setlength{\footskip}       {15mm}
\if@Korean
	\setlength{\textheight} {195mm}
	\setlength{\footskip}   {15mm}
\fi

% \title 명령어 재설정
% 한글, 영어 두 종류의 타이틀을 모두 넣는다.
% Usage: \title[korean]{Korean_Title}
% Usage: \title[english]{English_Title}

% chapter style
\renewcommand\contentsname{Table of Contents}
% \renewcommand\thechapter{\Roman{chapter}.~~}
% \renewcommand\thesection{\Alph {section}.}
% \renewcommand\thesubsection{\arabic{subsection}.}
\renewcommand\thechapter{\Roman{chapter}}
\renewcommand\thesection{\Alph {section}}
\renewcommand\thesubsection{\arabic{subsection}}
\renewcommand{\p@section}{\thechapter.}
\renewcommand{\p@subsection}{\thechapter.\thesection.}
\renewcommand\abstractname{Abstract}
\sectionfont{\fontsize{13}{13}\selectfont}
\subsectionfont{\fontsize{12}{12}\selectfont}
\subsubsectionfont{\fontsize{11}{11}\selectfont}

%% Table of contents formatting
\renewcommand{\cftchapdotsep}{\cftdotsep} % Give chapters dots too
\renewcommand{\cftdotsep}{1} % More dots
\renewcommand\cftchapfont{\bfseries\fontsize{12pt}{16pt}\selectfont}
\renewcommand\cftsecfont{\fontsize{12pt}{16pt}\selectfont}
\renewcommand\cftsubsecfont{\fontsize{12pt}{16pt}\selectfont}
\renewcommand\cftchappagefont{\bfseries\fontsize{12pt}{16pt}\selectfont}
\renewcommand\cftsecpagefont{\fontsize{12pt}{16pt}\selectfont}
\renewcommand\cftsubsecpagefont{\fontsize{12pt}{16pt}\selectfont}
\setlength{\cftchapnumwidth}{1.0cm}
\setlength{\cftsecnumwidth}{0.7cm}
\setlength{\cftsubsecnumwidth}{0.6cm}
\setlength{\cftsecindent}{1.1cm}
\setlength{\cftsubsecindent}{1.9cm}
\setlength{\cftbeforechapskip}{1.0ex}
% \setlength{\cftbeforechapskip}{0.5ex}

% List of figures and tables formatting
\DeclareCaptionListFormat{figprefix}{#1\figurename~#2.}
\DeclareCaptionListFormat{tabprefix}{#1\tablename~#2.}
\captionsetup[figure]{listformat=figprefix}
\captionsetup[table]{listformat=tabprefix}
% \addtolength{\cftfignumwidth}{46pt}% More space
% \addtolength{\cfttabnumwidth}{42pt}% More space
\addtolength{\cftfignumwidth}{38pt}% More space
\addtolength{\cfttabnumwidth}{34pt}% More space
\renewcommand\cftfigfont{\fontsize{12pt}{16pt}\selectfont}
\renewcommand\cfttabfont{\fontsize{12pt}{16pt}\selectfont}
\newcommand*{\noaddvspace}{\renewcommand*{\addvspace}[1]{}}
\addtocontents{lof}{\protect\noaddvspace}
\addtocontents{lot}{\protect\noaddvspace}

% figure and table style
% \renewcommand{\thefigure}{\Roman{chapter}-\arabic{figure}.}
% \renewcommand{\thetable}{\Roman{chapter}-\arabic{table}.}
\renewcommand{\thefigure}{\arabic{chapter}.\arabic{figure}}
\renewcommand{\thetable}{\arabic{chapter}.\arabic{table}}
\renewcommand{\theequation}{\arabic{chapter}.\arabic{equation}}

%\DeclareCaptionFormat{custom}{#1 #3}
\captionsetup{labelsep=period}
\captionsetup[table]{font={stretch=1.2}}     %% change 1.2 as you like
\captionsetup[figure]{font={stretch=1.2}}    %% change 1.2 as you like
\renewcommand{\arraystretch}{0.75}
\setlength\intextsep{20pt}

% renew related strings if Korean.
\if@Korean
	% very dirty and inconsistant... kscntformat sometimes does not work,
	% so I overrided them with renewcommand.
	\kscntformat{chapter}{제~}{~장}
	\kscntformat{section}{\arabic{chapter}.}{}
	\renewcommand\thesubsection{\arabic{chapter}.\arabic{section}.\arabic{subsection}}

	\ksnamedef{abstractname}{초록}
	\ksnamedef{contentsname}{목차}
	\ksnamedef{listtablename}{표 목차}
	\ksnamedef{listfigurename}{그림 목차}

	% for table of contents
	% need tocloft package
	\renewcommand\cftfigpresnum{그림 }
	\addtolength\cftfignumwidth{2.3em}
	\renewcommand\cfttabpresnum{표 }
	\addtolength\cfttabnumwidth{2.3em}
\fi

\renewcommand{\title}[2][korean]{%
    \ifthenelse{\equal{#1}{korean}}{\newcommand{\@KorTitle}{#2}}{}%
    \ifthenelse{\equal{#1}{english}}{\newcommand{\@EngTitle}{#2}}{}%
}
\@onlypreamble{\title}

% 저자 정보
\renewcommand{\author}[2][korean]{%
    \ifthenelse{\equal{#1}{korean}}{\newcommand{\@KorAuthor}{#2}}{}%
    \ifthenelse{\equal{#1}{english}}{\newcommand{\@EngAuthor}{#2}}{}%
    \ifthenelse{\equal{#1}{nospace}}{\newcommand{\@AuthorNS}{#2}}{}%
    }
\@onlypreamble{\author}

\newcommand{\department}[2][korean]{%
    \ifthenelse{\equal{#1}{korean}}{\newcommand{\@KorDept}{#2}}{}%
    \ifthenelse{\equal{#1}{space}}{\newcommand{\@DeptSP}{#2}}{}%
    }
\@onlypreamble{\department}

\newcommand{\school}[1]{\newcommand{\@school}{#1}}
\@onlypreamble{\school}

% 지도교수 정보
\newcommand{\adviser}[1]{\newcommand{\@adviser}{#1}}
\@onlypreamble{\adviser}

%심사위원 정보
\newcommand{\commitee}[2][1]{%
	\ifthenelse{\equal{#1}{1}}{\newcommand{\@commiteeFirst} {#2}} {}%
	\ifthenelse{\equal{#1}{2}}{\newcommand{\@commiteeSecond}{#2}} {}%
	\ifthenelse{\equal{#1}{3}}{\newcommand{\@commiteeThird} {#2}} {}%
	\ifthenelse{\equal{#1}{4}}{\newcommand{\@commiteeFourth}{#2}} {}%
	\ifthenelse{\equal{#1}{5}}{\newcommand{\@commiteeFifth} {#2}} {}%
}
\@onlypreamble{\commitee}

% 논문 제출일
\newcommand{\submissiondeadline}[1]{%
    \newcommand{\@SubmissionYear}{#1}
}
\@onlypreamble{\submissiondeadline}

% 논문 심사일
\newcommand{\examinationyear}[1]{%
    \newcommand{\@ExamYear}{#1}
}
\newcommand{\examinationdate}[1]{%
    \newcommand{\@ExamDate}{#1}
}
\@onlypreamble{\examinationdate}

% 졸업년월
\newcommand{\gradyear}[2][english]{%
    \ifthenelse{\equal{#1}{english}}{\newcommand{\@GradYearEng}{#2}}{}%
    \ifthenelse{\equal{#1}{korean} }{\newcommand{\@GradYearKor}{#2}}{}%
}
\@onlypreamble{\gradyear}


\AtBeginDocument{%
    \makecover%
    \makeinnercover%
    \makeapproval%
    }
\AtEndDocument{}


% 외표지 작성
\newcommand{\makecover}{%
            \thispagestyle{empty}
            %\changetext{}{10mm}{-5mm}{}{}
%           \noindent
            \begin{flushleft}
                {
                 \fontsize {16pt}{24pt}
                 \selectfont
				\if@Doctor
				    \textbf{\@school\\
					{\fontspec[AutoFakeBold=2.0]{HMFMM.ttf}\@GradYearEng학년도}\\
				    박사학위 청구논문\\
				    }
				\else
					\textbf{\@school\\
					{\fontspec[AutoFakeBold=2.0]{HMFMM.ttf}\@GradYearEng학년도}\\
				    석사학위 청구논문\\
				    }
				\fi
                }
			\end{flushleft}
			\begin{center}
                \vspace*{3.0cm}
                \fontsize {21pt}{31.5pt}
                \selectfont
				\if@Korean
					\textbf{\@KorTitle}\ \\
				\else
					\textbf{\@EngTitle}\ \\
				\fi
            \vfill
            \end{center}
                \begin{minipage}[b]{\textwidth}
                    \begin{center}
                    \fontsize {16pt}{16pt}
                    \textbf{\@DeptSP} \\
                    \vspace*{0.5cm}
				    \fontsize {16pt}{16pt}
				    \selectfont
    				\if@Korean
    				    \textbf{\@KorAuthor}\\
    				\else
    					{\fontspec[AutoFakeBold=2.0]{HMFMM.ttf}\textbf{\@EngAuthor}} \\
    				\fi
    				\vspace*{0.5cm}
				    \fontsize {16pt}{16pt}
				    \selectfont
                    {\fontspec[AutoFakeBold=2.0]{HMFMM.ttf}\textbf{\@GradYearEng}} \\
                    %\addvspace{1cm}
                    %\vspace*{0.5cm}
                    \end{center}
                \end{minipage}
            \newpage
            }

%내표지 작성
% The same as "outer" cover.
\newcommand{\makeinnercover}{%
            \thispagestyle{empty}
            %\changetext{}{10mm}{-5mm}{}{}
%           \noindent
			\begin{center}
                \vspace*{3cm}
                \fontsize {21pt}{31.5pt}
                \selectfont
				\if@Korean
					\textbf{\@KorTitle}\ \\
				\else
					\textbf{\@EngTitle}\ \\
				\fi
				\addvspace{5cm}
				\fontsize {16pt}{16pt}
				\selectfont
				\if@Doctor
				    \textbf{이 논문을 박사학위 논문으로 제출함}\\
				\else
				    \textbf{이 논문을 석사학위 논문으로 제출함}\\
				\fi
				\vspace*{1.5cm}
				\fontsize {12pt}{12pt}
				\selectfont
				{\fontspec[AutoFakeBold=2.0]{HMFMM.ttf}\textbf{\@ExamDate}} \\
                % \addvspace{3cm}
            \vfill
            \end{center}
                \begin{minipage}[b]{\textwidth}
                    \begin{center}
                    \fontsize {12pt}{12pt}
                    \selectfont
                    \textbf{\@school} \\
                    \vspace*{1.0cm}
				    \fontsize {16pt}{16pt}
				    \selectfont
				    \textbf{\@DeptSP} \hspace{0.3cm}
    				\if@Korean
    					\textbf{\@KorAuthor} \\				
    				\else
    					{\fontspec[AutoFakeBold=2.0]{HMFMM.ttf}\textbf{\@EngAuthor}} \\
    				\fi
                    \end{center}
                \end{minipage}
            
            \newpage
            }
            
            

%인준지 작성
\newcommand{\makeapproval}{%
            \thispagestyle{empty}
            %\changetext{10mm}{-10mm}{5mm}{}{}
            \noindent
            \begin{center}
                \vspace*{2cm}
                \fontsize {21pt}{21pt}
                \selectfont
                \if@Doctor
                    \textbf{\@EngAuthor 의 박사학위 논문을 인준함}\\
                \else
                    \textbf{\@EngAuthor 의 석사학위 논문을 인준함}\\
                \fi
                \vspace{2.0cm}

            \end{center}
            \begin{flushright}
                \if@Doctor
                    \fontsize {12pt}{1.5cm}
                    % \selectfont
                    \textbf{지도교수}\hspace{0.5cm}\underline{~~~~~~~~~~~~\@adviser~~~~~~}\hspace{0.5cm}\underline{~~~~~~~~~~~~~~}~~~~~~~~~~~~~~~~~~~~\\
                    \vspace{2.0cm}
                    \textbf{심사위원}\hspace{0.5cm}\underline{~~~~~~~~~~~~\@commiteeFirst~~~~~~}\hspace{0.5cm}\underline{~~~~~~~~~~~~~~}~~~~~~~~~~~~~~~~~~~~\\
                    \vspace{0.9cm}
                    ~~~~~~~~~~\hspace{0.5cm}\underline{~~~~~~~~~~~~\@commiteeSecond~~~~~~}\hspace{0.5cm}\underline{~~~~~~~~~~~~~~}~~~~~~~~~~~~~~~~~~~~\\
                    \vspace{0.9cm}
                    ~~~~~~~~~~\hspace{0.5cm}\underline{~~~~~~~~~~~~\@commiteeThird~~~~~~}\hspace{0.5cm}\underline{~~~~~~~~~~~~~~}~~~~~~~~~~~~~~~~~~~~\\
                    \vspace{0.9cm}
                    ~~~~~~~~~~\hspace{0.5cm}\underline{~~~~~~~~~~~~\@commiteeFourth~~~~~~}\hspace{0.5cm}\underline{~~~~~~~~~~~~~~}~~~~~~~~~~~~~~~~~~~~\\
                    \vspace{0.9cm}
                    ~~~~~~~~~~\hspace{0.5cm}\underline{~~~~~~~~~~~~\@commiteeFifth~~~~~~}\hspace{0.5cm}\underline{~~~~~~~~~~~~~~}~~~~~~~~~~~~~~~~~~~~\\
                \else
                    \fontsize {12pt}{1.5cm}
                    % \selectfont
                    \textbf{지도교수}\hspace{0.5cm}\underline{~~~~~~~~~~~~\@adviser~~~~~~}\hspace{0.5cm}\underline{~~~~~~~~~~~~~~}~~~~~~~~~~~~~~~~~~~~\\
                    \vspace{2.0cm}
                    \textbf{심사위원}\hspace{0.5cm}\underline{~~~~~~~~~~~~\@commiteeFirst~~~~~~}\hspace{0.5cm}\underline{~~~~~~~~~~~~~~}~~~~~~~~~~~~~~~~~~~~\\
                    \vspace{0.9cm}
                    ~~~~~~~~~~\hspace{0.5cm}\underline{~~~~~~~~~~~~\@commiteeSecond~~~~~~}\hspace{0.5cm}\underline{~~~~~~~~~~~~~~}~~~~~~~~~~~~~~~~~~~~\\
                    \vspace{0.9cm}
                    ~~~~~~~~~~\hspace{0.5cm}\underline{~~~~~~~~~~~~\@commiteeThird~~~~~~}\hspace{0.5cm}\underline{~~~~~~~~~~~~~~}~~~~~~~~~~~~~~~~~~~~\\
                \fi
                \vfill
            \end{flushright}
            \begin{minipage}[b]{\textwidth}
                \begin{center}
                \fontsize {16pt}{16pt}
                \selectfont
                \textbf{\@school} \\
                \end{center}
            \end{minipage}
            \newpage
            %\changetext{-15mm}{}{}{}{}
            }

%chapter 설정
\renewcommand\chapter{%
	\if@openright\cleardoublepage\else\clearpage\fi%
	\thispagestyle{plain}
	\global\@topnum\z@
	\@afterindentfalse
	\secdef\@chapter\@schapter}
\def\@chapter[#1]#2{%
	\ifnum \c@secnumdepth >\m@ne
		\refstepcounter{chapter}%
		\typeout{\@chapapp\space\thechapter.}%
		\if@Korean
			\addcontentsline{toc}{chapter}{\numberline{제~\thechapter~장} #1}
		\else
			\addcontentsline{toc}{chapter}{\protect\numberline{\thechapter.}#1}
		\fi
	\else
		\addcontentsline{toc}{chapter}{#1}%
	\fi
	\chaptermark{#1}%
	\addtocontents{lof}{\protect\addvspace{10\p@}}%
	\addtocontents{lot}{\protect\addvspace{10\p@}}%
	\if@twocolumn
		\@topnewpage[\@makechapterhead{#2}]%
	\else
		\@makechapterhead{#2}%
		\@afterheading%
	\fi
}
\def\@makechapterhead#1{%
% 	\if@Korean\else
		%\vspace*{50\p@}
% 	\fi
	{\parindent\z@
	 \centering
	 \fontsize{16pt}{16pt}
	 \selectfont
	 \bfseries
	 \if@Korean
	 	{
			제~\thechapter~장~#1
		}
	 \else
		{
		\thechapter.~~#1
		} \par
	\fi
	}
	\vskip 30\p@
}
\def\@schapter#1{%
	\if@twocolumn
		\@topnewpage[\@makeschapterhead{#1}]%
	\else
		\@makeschapterhead{#1}%
		\@afterheading
	\fi}
\def\@makeschapterhead#1{
	%\if@Korean\else
	%	\vspace*{50\p@}
	%\fi
	{\centering %\parindent\z@
	\fontsize{16pt}{20pt}
	\selectfont
	\bfseries #1\par}
	\vskip 20\p@
}

%% Section
\def\@seccntformat#1{\@ifundefined{#1@cntformat}%
   {\csname the#1\endcsname\space}%    default
   {\csname #1@cntformat\endcsname}}%  enable individual control
\newcommand\section@cntformat{\thesection.~~} % section-level
\renewcommand{\cftsecaftersnum}{.}

%% Subsection
\def\@seccntformat#1{\@ifundefined{#1@cntformat}%
   {\csname the#1\endcsname\space}%    default
   {\csname #1@cntformat\endcsname}}%  enable individual control
\newcommand\subsection@cntformat{\thesubsection.~~} % section-level
\renewcommand{\cftsubsecaftersnum}{.}

%% Abstract
\newcounter{pagemarker}
\newcommand{\@lastPage}{\pageref{paperlastpagelabel}}
\renewenvironment{abstract}{%
    \pagenumbering{roman}
    \setcounter{page}{\value{pagemarker}}
    \pagestyle{plain}%
    \newcommand{\@tempbreak}{}
    \let\@tempbreak\linebreak
    \renewcommand{\linebreak}{\ }
    \newlength{\@thesisinfowidth}
    \setlength{\@thesisinfowidth}{\textwidth}
    %\addtolength{\@thesisinfowidth}{-20mm}
    %\noindent
    \begin{center}
    \fontsize {16pt}{20pt}
    \selectfont
    \textbf{\abstractname} \\
    \end{center}
    \vspace{40\p@}
    % \fontsize {10.5pt}{20pt}
    \selectfont 
    %\addcontentsline{toc}{chapter}{\abstractname}
}{  \setcounter{pagemarker}{\value{page}}
    \addtocounter{pagemarker}{1}
    \newpage \pagenumbering{arabic}
    \let\linebreak\@tempbreak
}

\titlespacing*{\section}
{0pt}{5.5ex plus 1ex minus .2ex}{3.3ex plus .2ex}
\titlespacing*{\subsection}
{0pt}{5.5ex plus 1ex minus .2ex}{3.3ex plus .2ex}

%%
%% 목차
%%
\newcommand{\makelists}{%
	\if@Korean
		\tableofcontents
		\clearpage
		\listoffigures
		\clearpage
		\listoftables
		\clearpage
	\else
		\tableofcontents
		\clearpage
		\listoffigures
		\clearpage
		\listoftables
		\clearpage
	\fi
}

% Typesetting for toc, tot, tof
\if@Korean
	% TOC
    \setlength{\cftbeforetoctitleskip}{0pt}
	\renewcommand{\cftaftertoctitle}{\hfill}
	\renewcommand{\cfttoctitlefont}
	{
		\hfill\bfseries
		\fontsize{22pt}{26pt}
		\selectfont
	}
	% LOF
    \setlength{\cftbeforeloftitleskip}{0pt}
	\renewcommand{\cftafterloftitle}{\hfill}
	\renewcommand{\cftloftitlefont}
	{
		\hfill\bfseries
		\fontsize{22pt}{26pt}
		\selectfont
	}
	% LOT
    \setlength{\cftbeforelottitleskip}{0pt}
	\renewcommand{\cftafterlottitle}{\hfill}
	\renewcommand{\cftlottitlefont}
	{
		\hfill\bfseries
		\fontsize{22pt}{26pt}
		\selectfont
	}
\fi

\if@Korean\else
\renewcommand\tableofcontents{%
    \if@twocolumn
        \@restonecoltrue\onecolumn
    \else
        \@restonecolfalse
    \fi
    \chapter*{\contentsname
        \@mkboth{\MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
    \setcounter{page}{\value{pagemarker}}
    \pagenumbering{roman}
    % \addcontentsline{toc}{chapter}{\contentsname}
    \@starttoc{toc}%
    \if@restonecol\twocolumn\fi
    \newpage \setcounter{pagemarker}{\value{page}}
    \pagenumbering{arabic}
}
\fi


%%
%% \listoftables 재정의 - report 클래스로부터 복사하여 일부 수정
%%
\if@Korean\else
\renewcommand\listoftables{%
    \if@twocolumn
        \@restonecoltrue\onecolumn
    \else
        \@restonecolfalse
    \fi
    \chapter*{\listtablename}%
    \@mkboth{\MakeUppercase\listtablename}{\MakeUppercase\listtablename}%
    \pagenumbering{roman}
    \setcounter{page}{\value{pagemarker}}
    %\addcontentsline{toc}{chapter}{\listtablename}
    \@starttoc{lot}%
    \if@restonecol\twocolumn\fi
    \newpage \setcounter{pagemarker}{\value{page}}
    \pagenumbering{arabic}
}
\fi

%%
%% \listoffigures 재정의 - report 클래스로부터 복사하여 일부 수정
%%
\if@Korean\else
\renewcommand\listoffigures{%
    \if@twocolumn
        \@restonecoltrue\onecolumn
    \else
        \@restonecolfalse
    \fi
    \chapter*{\listfigurename}%
    \@mkboth{\MakeUppercase\listfigurename}{\MakeUppercase\listfigurename}%
    \pagenumbering{roman}
    \setcounter{page}{\value{pagemarker}}
    %\addcontentsline{toc}{chapter}{\listfigurename}
    \@starttoc{lof}%
    \if@restonecol\twocolumn\fi
    \newpage \setcounter{pagemarker}{\value{page}}
    \pagenumbering{arabic}
}
\fi

%%
%% 국문초록
%%


\newenvironment{summary}{%
	\if@Korean
		\chapter*{ABSTRACT}
		\addcontentsline{toc}{chapter}{Abstract}
		\begin{center}
		\fontsize {16pt}{16pt}
        \selectfont \textbf{\@EngTitle}\vspace{1.0cm}
        \end{center}
	\else
		\chapter*{국문초록}
		\addcontentsline{toc}{chapter}{Abstract (in Korean)}
		\begin{center}
		\fontsize {16pt}{16pt}
        \selectfont \textbf{\@KorTitle}\vspace{1.0cm}
        \end{center}
	\fi
	\begin{minipage}[t]{\textwidth}
	    \begin{flushright}
	    \fontsize {12pt}{12pt}
	    \selectfont 
		\@KorAuthor \\
		\@KorDept \\
		\@school
		\end{flushright}
	\end{minipage}
	\vspace{1.0cm}
    %\setlength{\parindent}{0pt}
    % \indent
}

\newcommand{\acknowledgement}{%
    % \vspace{-1cm}
	\if@Korean
		\chapter*{감사의 글}
% 		\addcontentsline{toc}{chapter}{감사의 글}
	\else
		\chapter*{감사의 글}
% 		\addcontentsline{toc}{chapter}{Acknowlegement}
	\fi
    \pagestyle{empty}
    \indent \vspace{-0.5cm}
}
