\ProvidesClass{seiler-resume}[2020/01/10 CV class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}

\usepackage{enumitem}
\usepackage{amssymb} 

\renewcommand{\labelitemi}{{\tiny$^\blacktriangleright$}}

%%%%%%%%%%
% Colors 		   %
%%%%%%%%%%

\RequirePackage{xcolor}

\definecolor{white}{RGB}{255,255,255}

\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{999999}

\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}

\ifdefined\@cv@print
  \colorlet{green}{gray}
  \colorlet{orange}{gray}
  \colorlet{purple}{gray}
  \colorlet{red}{gray}
  \colorlet{blue}{gray}
  \colorlet{fillheader}{white}
  \colorlet{header}{gray}
\else
  \colorlet{fillheader}{gray}
  \colorlet{header}{white}
\fi
\colorlet{textcolor}{gray}
\colorlet{headercolor}{gray}

%%%%%%%%%
% Fonts 		%
%%%%%%%%%

 \RequirePackage[quiet]{fontspec}
\RequirePackage{tgheros}
% \RequirePackage[math-style=TeX,vargreek-shape=unicode]{unicode-math}
% 
%\newfontfamily\bodyfont[]{Helvetica Neue}
\newfontfamily\bodyfont[]{Source Sans Pro}
%\newfontfamily\bodyfont[]{\qhv}
 \newfontfamily\thinfont[]{Helvetica Neue UltraLight}
 \newfontfamily\headingfont[]{Helvetica Neue Condensed Bold}
% 
% \defaultfontfeatures{Mapping=tex-text}
\setmainfont[Mapping=tex-text]{Source Sans Pro}%Helvetica Neue Light}%, Color=textcolor
% 
% \setmathfont{XITS Math}


%\defaultfontfeatures{
%  Extension = .otf
%}
%\usepackage{fontawesome}
%\newfontfamily\fatest{FontAwesome.otf} % Explicitly provide .otf
%\newfontfamily{\FA}{FontAwesome}

%\RequirePackage[math-style=TeX]{unicode-math}

%\newfontfamily\thinfont[]{carlito}%{Lato-Light.ttf}
%\newfontfamily\headingfont[Path={/usr/local/texlive/2017/texmf-dist/fonts/opentype/public/tex-gyre/}]{texgyreheros-bold.otf}

%{texgyreheros-regular.otf}

%\setmathfont{texgyreheros.otf}
%%%

%%%%%%%%%%
% Header 	   %
%%%%%%%%%%

\RequirePackage{tikz}
\setlength{\itemindent}{-.5in}
\newcommand{\rolefont}{%
  \fontsize{14pt}{24pt}\selectfont%
  \thinfont%
  \color{white}%
}
%\RequirePackage{fontawesome}

\newcommand{\header}[4]{%
   \par\vspace{\parskip}
  {%
    \Huge{\thinfont #1}{\bodyfont #2}{\thinfont #3}\\[0.05em]%\Huge\headingfont \color{darkgray}%\color{headercolor}%
    \fontsize{14pt}{24pt}\color{black}\thinfont #4\vspace{-0.5em}\\%
    \line(1,0){180} \\
   % \@sectioncolor #1%
  }
 %\par\vspace{\parskip}
  }

\newcommand{\headerTwo}[4]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth, minimum height=4cm] (box) at (current page.north){};
    \node [anchor=center] (name) at (box) {%
      \fontsize{40pt}{72pt}\color{header}%
      {\thinfont #1}{\bodyfont  #2}{\thinfont #3}
    };
    \node [anchor=north] at (name.south) {%
      \fontsize{14pt}{24pt}\color{header}%
      \thinfont #4%
    };
     \end{tikzpicture}
  \vspace{2.5cm}
  \vspace{-2\parskip}
}


%%%%%%%%%%%%%
% Structure 		    %
%%%%%%%%%%%%%
\RequirePackage{parskip}

\renewcommand{\section}[1]{
  %\par\vspace{-0.5\parskip}
  {%
    \hspace{-1.3in}\line(1,0){93}\\ \vspace{-1em}
    \hspace{-1.3in}\parbox[c]{2.9cm}{\raggedright \large\headingfont \color{darkgray}#1}%\vspace{-0.5em}\\%
   % \hspace{-1.0in} \\%\color{headercolor}%
   % \@sectioncolor #1%
  }
  \par\vspace{-1.1\parskip}
}

\renewcommand{\subsection}[1]{
  \par\vspace{.5\parskip}%
  {%
  \large\headingfont\color{headercolor} #1%
  }
  \par\vspace{.25\parskip}%
}

\pagestyle{empty}

%%%%%%%%%%%%%%%%%%%%
% List environment 				 %
%%%%%%%%%%%%%%%%%%%%

\setlength{\tabcolsep}{0pt}
\newenvironment{entrylist}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  \end{tabular*}}

\renewcommand{\bfseries}{\headingfont\color{headercolor}}
\newcommand{\entry}[4]{%
  #1&\parbox[t]{11.8cm}{%
    \textbf{#2}%
    \hfill%
    {\footnotesize\addfontfeature{Color=lightgray} #3}\\%
    #4\vspace{\parsep}%
  }\\ 
  }
  
\newcommand{\job}[4]{%
  \textbf{#1}\hspace{1cm} &%\parbox[t]{10.8cm}{%
  \textit{#2}% 
  \hfill %\hspace{2cm}%
  #3\\* 
 \multicolumn{2}{l}{\parbox[t]{14.5cm}{#4}} %
 \vspace{\parsep} \\ 
  }
  % \hspace{1cm} \textit{#2} \hfill {#3} \\ {#4}}
  %{\small{\makebox[-0.25in][10pt]{} \textit{#1} \hfill \textbf{#2} \\*  {#3}\vspace{.8em}\\* } }}
  
\newcommand{\project}[4]{%
  \hspace{-1cm} \textbf{#1}\hspace{1cm} &%\parbox[t]{10.8cm}{%
  \textit{#2}% 
  \hfill %\hspace{2cm}%
  #3\\* 
  \multicolumn{2}{l}{\hspace{-0.9cm}\parbox[t]{16cm}{#4}} %
 \vspace{\parsep} \\ 
  }


%%%%%%%%%%%%%%
% Side block 			%
%%%%%%%%%%%%%%

\RequirePackage[absolute,overlay]{textpos}
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}
\newenvironment{aside}{%
  \let\oldsection\section
  \renewcommand{\section}[1]{
    \par\vspace{\baselineskip}{\Large\headingfont\color{headercolor} ##1}
  }
  \begin{textblock}{3.6}(1.5, 4.33)
  \begin{flushright}
  \obeycr
}{%
  \restorecr
  \end{flushright}
  \end{textblock}
  \let\section\oldsection
}

\newenvironment{emailphone}{%
  \let\oldsection\section
  \renewcommand{\section}[1]{
    \par\vspace{\baselineskip}{\Large\headingfont\color{headercolor} ##1}
  }
  \begin{textblock}{3.6}(15.5, 1.6)
  \begin{flushright}
  \obeycr
}{%
  \restorecr
  \end{flushright}
  \end{textblock}
  \let\section\oldsection
}


%%%%%%%%%%%%%%%%
% Bibliography 			      %
%%%%%%%%%%%%%%%%

\RequirePackage[style=verbose, maxnames=99, sorting=ydnt]{biblatex}

\DeclareFieldFormat[article]{title}{#1\par}
\DeclareFieldFormat[inproceedings]{title}{#1\par}
\DeclareFieldFormat[misc]{title}{#1\par}
\DeclareFieldFormat[report]{title}{#1\par}

\DeclareBibliographyDriver{article}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \usebibmacro{journal+issuetitle}%
    \setunit{\space}%
    \printfield{pages}%
    \newunit%
    \printlist{publisher}%
    \setunit*{\addcomma\space}%
    \printfield{year}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{inproceedings}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}%
    \printfield{booktitle}%
    \setunit{\addcomma\space}%
    \printfield{year}%
    \setunit{\addcomma\space}%
    \printlist{location}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{misc}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \printfield{booktitle}%
    \setunit*{\addcomma\space}%
    \printfield{note}%
    \setunit*{\addcomma\space}%
    \printfield{year}%
    \setunit{\addcomma\space}%
    \printlist{location}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{report}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \printfield{type}%
    \setunit{\space}%
    \printfield{number}%
    \setunit{\addcomma\space}%
    \printfield{year}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareNameFormat{author}{%
  \small\addfontfeature{Color=lightgray}%
  \ifblank{##3}{}{##3\space}#1%
  \ifthenelse{\value{listcount}<\value{liststop}}
    {\addcomma\space}
    {}%
}

\newcommand{\printbibsection}[2]{
  \begin{refsection}
    \nocite{*}
    \printbibliography[sorting=chronological, type={#1}, title={#2}, heading=subbibliography]
  \end{refsection}
}

\DeclareSortingScheme{chronological}{
  \sort[direction=descending]{\field{year}}
  \sort[direction=descending]{\field{month}}
}



%%%%%%%%%%%%%%%%
% Other tweaks 		      %
%%%%%%%%%%%%%%%%
\definecolor{darkishblue}{HTML}{36457E}
\RequirePackage[left=4.8cm,top=2cm,right=2.5cm,bottom=2.5cm,nohead,nofoot]{geometry}
\RequirePackage{hyperref}
\hypersetup{
    colorlinks=true,
    linkcolor=blue,
    filecolor=magenta,      
    urlcolor=darkishblue
}
