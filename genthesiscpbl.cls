%%
%% This is file `genthesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% ubcthesis.dtx  (with options: `genthesis')
%% 
%% This file was generated from the ubcthesis package.
%% --------------------------------------------------------------
%% 
%% Copyright (C) 2001
%% Michael McNeil Forbes
%% mforbes@alum.mit.edu
%% 
%% This file may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.2
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%    http://www.latex-project.org/lppl.txt
%% and version 1.2 or later is part of all distributions of LaTeX
%% version 1999/12/01 or later.
%% 
%% This program consists of the files ubcthesis.dtx, ubcthesis.ins, and
%% the sample figures fig.eps and fig.fig.
%% 
%% This file may only be distributed together with a copy of this
%% program. You may, however, distribute this program without generated
%% files such as this one.
%% 


\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{genthesis}[2005/11/15 v1.31 ^^J
 University of British Columbia Thesis Class]
\global\let\and\@undefined
\newcommand\@ptsize{}
\newif\if@restonecol
\newif\if@chaptertocdots \@chaptertocdotstrue
\newcommand{\@addto}[2]{
  \expandafter\let\expandafter\old\csname#1\endcsname
  \toks1=\expandafter{\old}
  \toks2=\expandafter{#2}
  \expandafter\xdef\csname#1\endcsname{\the\toks1 \the\toks2 }
}
\setcounter{secnumdepth}{4}
\newcount\hours
\newcount\minutes
\def\SetTime{\hours=\time
        \global\divide\hours by 60
        \minutes=\hours
        \multiply\minutes by 60
        \advance\minutes by-\time
        \global\multiply\minutes by-1 }
\def\now{\number\hours:\ifnum\minutes<10 0\fi\number\minutes}
\newcommand\@toupper[1]{\if@upper\MakeUppercase{#1}\else{#1}\fi}
\newcommand\@toctoupper[1]{\if@tocupper\MakeUppercase{#1}\else{#1}\fi}
\newcommand{\@condupper}[2]{%
  \if#1{\MakeUppercase{#2}}\else{{#2}}\fi}
\newlength{\UBCT@oldtextwidth}
\newlength{\UBCT@oldtextheight}
\newlength{\UBCT@oldoddsidemargin}
\newlength{\UBCT@oldevensidemargin}
\newlength{\UBCT@oldtopmargin}
\newlength{\UBCT@oldtopskip}
\newlength{\UBCT@old@colht}
\newlength{\UBCT@old@colroom}
\newlength{\UBCT@oldvsize}
\newlength{\UBCT@oldcolumnwidth}
\newlength{\UBCT@oldhsize}
\newlength{\UBCT@oldlinewidth}
\newlength{\UBCT@oldparindent}
\newlength{\UBCT@oldmarginparsep}
\newlength{\UBCT@oldmarginparwidth}
\providecommand*{\@startonecolumn}{
  \global\setlength{\UBCT@oldtextwidth}{\textwidth}
  \global\setlength{\UBCT@oldtextheight}{\textheight}
  \global\setlength{\UBCT@oldoddsidemargin}{\oddsidemargin}
  \global\setlength{\UBCT@oldevensidemargin}{\evensidemargin}
  \global\setlength{\UBCT@oldtopmargin}{\topmargin}
  \global\setlength{\UBCT@oldtopskip}{\topskip}
  \global\setlength{\UBCT@old@colht}{\@colht}
  \global\setlength{\UBCT@old@colroom}{\@colroom}
  \global\setlength{\UBCT@oldvsize}{\vsize}
  \global\setlength{\UBCT@oldcolumnwidth}{\columnwidth}
  \global\setlength{\UBCT@oldhsize}{\hsize}
  \global\setlength{\UBCT@oldlinewidth}{\linewidth}
  \global\setlength{\UBCT@oldparindent}{\parindent}
  \global\setlength{\UBCT@oldmarginparsep}{\marginparsep}
  \global\setlength{\UBCT@oldmarginparwidth}{\marginparwidth}
  \global\let\UBCT@oldbaselinestretch=\baselinestretch

  \if@twocolumn
    \@restonecoltrue

    \setlength\@tempdima{\paperwidth}
    \addtolength\@tempdima{-2in}
    \ifcase\@ptsize\relax
      \setlength\@tempdimb{345\p@}
    \or
      \setlength\@tempdimb{360\p@}
    \or
      \setlength\@tempdimb{390\p@}
    \fi
    \ifdim\@tempdima>\@tempdimb\relax
      \global\setlength\textwidth{\@tempdimb}
    \else
      \global\setlength\textwidth{\@tempdima}
    \fi
    \global\@settopoint\textwidth
    \global\setlength\linewidth{\textwidth}
    \global\setlength\marginparsep{7\p@}

    \ifcase\@ptsize\relax
      \global\setlength\parindent{15\p@}
    \or
      \global\setlength\parindent{17\p@}
    \or
      \global\setlength\parindent{1.5em}
    \fi

    \if@twoside
      \setlength\@tempdima        {\paperwidth}
      \addtolength\@tempdima      {-\textwidth}
      \global\setlength\oddsidemargin {.4\@tempdima}
      \addtolength\oddsidemargin  {-1in}
      \global\setlength\marginparwidth   {.6\@tempdima}
      \global\addtolength\marginparwidth {-\marginparsep}
      \global\addtolength\marginparwidth {-0.4in}
    \else
      \setlength\@tempdima        {\paperwidth}
      \addtolength\@tempdima      {-\textwidth}
      \global\setlength\oddsidemargin    {.5\@tempdima}
      \global\addtolength\oddsidemargin  {-1in}
      \global\setlength\marginparwidth   {.5\@tempdima}
      \global\addtolength\marginparwidth {-\marginparsep}
      \global\addtolength\marginparwidth {-0.4in}
      \global\addtolength\marginparwidth {-.4in}
    \fi
    \ifdim \marginparwidth >2in
      \global\setlength\marginparwidth{2in}
    \fi
    \global\@settopoint\oddsidemargin
    \global\@settopoint\marginparwidth

    \global\setlength\evensidemargin  {\paperwidth}
    \global\addtolength\evensidemargin{-2in}
    \global\addtolength\evensidemargin{-\textwidth}
    \global\addtolength\evensidemargin{-\oddsidemargin}

    \global\@settopoint\evensidemargin
    \onecolumn
  \else
    \@restonecolfalse
  \fi
}
\providecommand*{\@endonecolumn}{
  \global\setlength{\textwidth}{\UBCT@oldtextwidth}
  \global\setlength{\textheight}{\UBCT@oldtextheight}
  \global\setlength{\oddsidemargin}{\UBCT@oldoddsidemargin}
  \global\setlength{\evensidemargin}{\UBCT@oldevensidemargin}
  \global\setlength{\topmargin}{\UBCT@oldtopmargin}
  \global\setlength{\topmargin}{\UBCT@oldtopskip}
  \global\setlength{\@colht}{\UBCT@old@colht}
  \global\setlength{\@colroom}{\UBCT@old@colroom}
  \global\setlength{\vsize}{\UBCT@oldvsize}
  \global\setlength{\columnwidth}{\UBCT@oldcolumnwidth}
  \global\setlength{\hsize}{\UBCT@oldhsize}
  \global\setlength{\linewidth}{\UBCT@oldlinewidth}
  \global\setlength{\parindent}{\UBCT@oldparindent}
  \global\setlength{\marginparsep}{\UBCT@oldmarginparsep}
  \global\setlength{\marginparwidth}{\UBCT@oldmarginparwidth}
  \global\let\baselinestretch=\UBCT@oldbaselinestretch
  \if@restonecol
    \twocolumn
  \fi}
\newif\if@openright
\newif\if@mainmatter \@mainmattertrue
\def\if@empty#1#2\else#3\fi{%
  \def\UBCT@tempa{}\ifx\UBCT@tempa#1#2\else#3\fi}
\newif\if@subtitle \@subtitlefalse
\newcommand*{\subtitle}[1]{\@subtitletrue \gdef\@subtitle{#1}}
\newcommand*{\institution}[1]{\gdef\@institution{#1}}
\providecommand*{\@institution}{%
  \ClassWarning{genthesis}{No \noexpand\institution given}}
\newcommand*{\institutionaddress}[1]{\gdef\@institutionaddress{#1}}
\providecommand*{\@institutionaddress}{%
  \ClassWarning{genthesis}{No \noexpand\institutionaddress given}}
\newcommand*{\degreetitle}[1]{\gdef\@degreetitle{#1}}
\providecommand*{\@degreetitle}{%
  \ClassWarning{genthesis}{No \noexpand\degreetitle given}}
\newcommand*{\degreedate}[1]{\gdef\@degreedate{#1}}
\providecommand*{\@degreedate}{%
  \ClassWarning{genthesis}{No \noexpand\degreedate given}}
\newcommand*{\department}[1]{\gdef\@department{#1}}
\providecommand*{\@department}{%
  \ClassWarning{genthesis}{No \noexpand\department given}}
\newcommand*{\program}[1]{\gdef\@program{#1}}
\providecommand*{\@program}{%
  \ClassWarning{genthesis}{No \noexpand\program given}}
\newcommand*{\faculty}[1]{\gdef\@faculty{#1}}
\providecommand*{\@faculty}{%
  \ClassWarning{genthesis}{No \noexpand\faculty given}}
\newcommand*{\advisor}[1]{\gdef\@advisor{#1}}
\providecommand*{\@advisor}{%
  \ClassWarning{genthesis}{No \noexpand\advisor given}}
\newcommand*{\advisortitle}[1]{\gdef\@advisortitle{#1}}
\providecommand*{\@advisortitle}{%
  \ClassWarning{genthesis}{No \noexpand\advisortitle given}}
\newcommand*{\copyrighttext}[1]{\gdef\@copyrighttext{#1}}
\providecommand*{\@copyrighttext}{%
  \ClassWarning{genthesis}{No \noexpand\copyrighttext given}}
\newcommand*{\copyrightnotice}[1]{\gdef\@copyrightnotice{#1}}
\providecommand*{\@copyrightnotice}{%
  \ClassWarning{genthesis}{No \noexpand\copyrightnotice given}}
\institution{AGH-University of Science and Technology}
\institutionaddress{Cracow, Poland}
\department{Department of E}
\program{in Telecommunications}
\faculty{The Faculty of Electrical Engineering, Automatics, Computer Science and Electronics}
\copyrighttext{\copyright\ \@author\ \@copyrightyear}
\copyrightnotice{All rights reserved.  This work may not be\\
  reproduced in whole or in part, by photocopy\\
  or other means, without permission of the author.}
\newcommand*{\numberofsignatures}[1]{\gdef\@numberofsignatures{#1}}
\numberofsignatures{4}
\newcommand*{\copyrightyear}[1]{\gdef\@copyrightyear{#1}}
\newcommand*{\submitdate}[1]{\gdef\@submitdate{#1}}
\copyrightyear{\number\year}
\submitdate{\today}
\newcommand{\UBCT@signatures}

\newcommand{\@signature}[3]{
  \vspace*{0.75in minus 0.5in}
  \if#1l#2\else\fi\dotfill\if#1r#2\else\fi\\*
  { \if#1l\raggedleft\fi%
    \if#1r\raggedright\fi%
    \if#1c\centering\fi%
    #3\par%
  }
}
\newcommand{\signature}[3][l]{\@signature{#1}{#2}{#3}}
\newcommand{\addsignature}[3][l]{
  \@addto{UBCT@signatures}{\@signature{#1}{#2}{#3}\par}
}
\iffalse
  \setbox\UBCT@abstractsignatures\vbox
  {\unvbox\UBCT@abstractsignatures \vskip\baselineskip
    \def\baselinestretch{1}\@normalsize
    \par\noindent #4: #2 \\ Title: #3}}

\newbox\UBCT@signatures
\newbox\UBCT@abstractsignatures

\fi

\newcommand\@previousdegrees{}
\newcommand\previousdegree[1]{
  \@addto{@previousdegrees}{#1\par}
}
\newcommand\titlepagefont{\normalsize}
\newcommand\titlefont{}
\newcommand\subtitlefont{\titlefont}
\newcommand\authorfont{\titlepagefont}
\newcommand\degreetitlefont{\titlepagefont}
\newcommand\facultyfont{\titlepagefont}
\newcommand\institutionfont{\titlepagefont}
\newcommand\abstractfont{}
\newcommand\partfont{}
\newcommand\partnamefont{}
\newcommand\chapterfont{}
\newcommand\chaptertitlefont{}
\newcommand\chapterauthorfont{}
\newcommand\sectionfont{}
\newcommand\subsectionfont{}
\newcommand\subsubsectionfont{}
\newcommand\paragraphfont{}
\newcommand\subparagraphfont{}
\newcommand\translatorfont{}
\newcommand\theoremheaderfont{}
\newcommand\theorembodyfont{}
\newcommand\itemfont{}
\newcommand\examplefont{}
\newcommand\headingstextfont{}
\newcommand\pagenumberfont{}
\newcommand\captionheaderfont{}
\newcommand\captionbodyfont{}
\newcommand\figurefont{}
\newcommand\tablefont{}
\newcommand\indexsize{}
\newcommand\bibsize{}
\newlength{\partbetweenskip}
\newlength{\chapterbeforeskip}
\newlength{\chapterbetweenskip}
\newlength{\chapterafterskip}
\newlength{\sectionindent}
\newlength{\sectionbeforeskip}
\newlength{\sectionafterskip}
\newlength{\subsectionindent}
\newlength{\subsectionbeforeskip}
\newlength{\subsectionafterskip}
\newlength{\subsubsectionindent}
\newlength{\subsubsectionbeforeskip}
\newlength{\subsubsectionafterskip}
\newlength{\paragraphindent}
\newlength{\paragraphbeforeskip}
\newlength{\paragraphafterskip}
\newlength{\subparagraphindent}
\newlength{\subparagraphbeforeskip}
\newlength{\subparagraphafterskip}
\newcommand{\lofindent}{1.5em}
\newcommand{\lotindent}{1.5em}
\newcommand{\loflabelwidth}{2.3em}
\newcommand{\lotlabelwidth}{2.3em}
\DeclareOption{a4paper}
   {\setlength\paperheight {297mm}%
    \setlength\paperwidth  {210mm}}
\DeclareOption{a5paper}
   {\setlength\paperheight {210mm}%
    \setlength\paperwidth  {148mm}}
\DeclareOption{b5paper}
   {\setlength\paperheight {250mm}%
    \setlength\paperwidth  {176mm}}
\DeclareOption{letterpaper}
   {\setlength\paperheight {11in}%
    \setlength\paperwidth  {8.5in}}
\DeclareOption{legalpaper}
   {\setlength\paperheight {14in}%
    \setlength\paperwidth  {8.5in}}
\DeclareOption{executivepaper}
   {\setlength\paperheight {10.5in}%
    \setlength\paperwidth  {7.25in}}
\DeclareOption{landscape}
   {\setlength\@tempdima   {\paperheight}%
    \setlength\paperheight {\paperwidth}%
    \setlength\paperwidth  {\@tempdima}}
\DeclareOption{10pt}{\renewcommand\@ptsize{0}}
\DeclareOption{11pt}{\renewcommand\@ptsize{1}}
\DeclareOption{12pt}{\renewcommand\@ptsize{2}}
\DeclareOption{oneside}{\@twosidefalse \@mparswitchfalse}
\DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue}
\newif\if@final \@finaltrue
\DeclareOption{draft}{\setlength\overfullrule{5pt}\@finalfalse \SetTime}
\DeclareOption{final}{\setlength\overfullrule{0pt}\@finaltrue}
\newif\if@committee \@committeefalse
\DeclareOption{committee}{\@committeetrue}
\DeclareOption{openright}{\@openrighttrue}
\DeclareOption{openany}{\@openrightfalse}
\DeclareOption{onecolumn}{\@twocolumnfalse}
\DeclareOption{twocolumn}{\@twocolumntrue}
\newif\if@runningheaders \@runningheaderstrue
\DeclareOption{runningheaders}{\@runningheaderstrue}
\DeclareOption{norunningheaders}{\@runningheadersfalse}
\newif\if@centerheadline \@centerheadlinetrue
\DeclareOption{centerheadline}{\@centerheadlinetrue}
\DeclareOption{nocenterheadline}{\@centerheadlinefalse}
\newif\if@headline \@headlinetrue
\DeclareOption{headline}{\@headlinetrue}
\DeclareOption{noheadline}{\@headlinefalse}
\DeclareOption{leqno}{\input{leqno.clo}}
\DeclareOption{fleqn}{\input{fleqn.clo}}
\newif\if@uppertitle \@uppertitlefalse
\DeclareOption{uppertitle}{\@uppertitletrue\@uppersubtitletrue}
\DeclareOption{nouppertitle}{\@uppertitlefalse\@uppersubtitlefalse}
\newif\if@uppersubtitle \@uppersubtitlefalse
\DeclareOption{uppersubtitle}{\@uppersubtitletrue}
\DeclareOption{nouppersubtitle}{\@uppersubtitlefalse}
\newif\if@upperauthor \@upperauthorfalse
\DeclareOption{upperauthor}{\@upperauthortrue}
\DeclareOption{noupperauthor}{\@upperauthorfalse}
\newif\if@upperdegreetitle \@upperdegreetitletrue
\DeclareOption{upperdegreetitle}{\@upperdegreetitletrue}
\DeclareOption{noupperdegreetitle}{\@upperdegreetitlefalse}
\newif\if@uppertitletext \@uppertitletexttrue
\DeclareOption{uppertitletext}{\@uppertitletexttrue}
\DeclareOption{nouppertitletext}{\@uppertitletextfalse}
\newif\if@upperfaculty \@upperfacultyfalse
\DeclareOption{upperfaculty}{\@upperfacultytrue}
\DeclareOption{noupperfaculty}{\@upperfacultyfalse}
\newif\if@upperdepartment \@upperdepartmentfalse
\DeclareOption{upperdepartment}{\@upperdepartmenttrue}
\DeclareOption{noupperdepartment}{\@upperdepartmentfalse}
\newif\if@upperprogram \@upperprogramfalse
\DeclareOption{upperprogram}{\@upperprogramtrue}
\DeclareOption{noupperprogram}{\@upperprogramfalse}
\newif\if@upperinstitution \@upperinstitutiontrue
\DeclareOption{upperinstitution}{\@upperinstitutiontrue}
\DeclareOption{noupperinstitution}{\@upperinstitutionfalse}
\DeclareOption{phd}{
  \degreetitle{Doctor of Philosophy}
  \numberofsignatures{4}
}
\DeclareOption{msc}{
  \degreetitle{Master of Science}
  \numberofsignatures{2}
}
\DeclareOption{masc}{
  \degreetitle{Master of Applied Science}
  \numberofsignatures{2}
}
\DeclareOption{ma}{
  \degreetitle{Master of Arts}
  \numberofsignatures{2}
}
\DeclareOption{meng}{
  \degreetitle{Master of Engineering}%
  \numberofsignatures{2}
  }
\newif\iflogo\logofalse
\DeclareOption{logo}{\logotrue}
\DeclareOption{nologo}{\logofalse}
\newif\if@chapterheads \@chapterheadstrue
\DeclareOption{chapterheads}{\@chapterheadstrue}
\DeclareOption{nochapterheads}{\@chapterheadsfalse}
\newif\if@headcount \@headcounttrue
\newif\if@partheads \@partheadstrue
\DeclareOption{partheads}{\@partheadstrue}
\DeclareOption{nopartheads}{\@partheadsfalse}
\newif\if@headcount \@headcounttrue
\DeclareOption{headcount}{\@headcounttrue}
\DeclareOption{noheadcount}{\@headcountfalse}
\newif\if@upper \@upperfalse
\DeclareOption{upper}{\@uppertrue}
\DeclareOption{noupper}{\@upperfalse}
\newif\if@tocupper \@tocupperfalse
\DeclareOption{tocupper}{\@tocuppertrue}
\DeclareOption{notocupper}{\@tocupperfalse}
\newcommand\@headingalignment{\raggedright}
\DeclareOption{leftheads}{\renewcommand\@headingalignment{\raggedleft}}
\DeclareOption{centerheads}{\renewcommand\@headingalignment{\centering}}
\DeclareOption{rightheads}{\renewcommand\@headingalignment{\raggedright}}
\newif\if@hangingcaptions \@hangingcaptionsfalse
\DeclareOption{hangingcaptions}{\@hangingcaptionstrue}
\DeclareOption{nohangingcaptions}{\@hangingcaptionsfalse}
\newif\if@appendixpart \@appendixpartfalse
\DeclareOption{appendixpart}{\@appendixparttrue}
\DeclareOption{noappendixpart}{\@appendixpartfalse}
\newif\if@appendixpage \@appendixpagetrue
\DeclareOption{appendixpage}{\@appendixpagetrue}
\DeclareOption{noappendixpage}{\@appendixpagefalse}
\DeclareOption{openbib}{%
  \AtEndOfPackage{%
   \renewcommand\@openbib@code{%
      \advance\leftmargin\bibindent
      \itemindent -\bibindent
      \listparindent \itemindent
      \parsep \z@
      }%
   \renewcommand\newblock{\par}}%
}
\newif\if@crosshair \@crosshairfalse
\DeclareOption{nocrosshair}{\@crosshairfalse}
\DeclareOption{crosshair}{\@crosshairtrue}
\DeclareOption{defaultfonts}{
    \renewcommand\titlepagefont{\normalsize}
    \renewcommand\titlefont{\Large \bfseries}
    \renewcommand\subtitlefont{\large \bfseries}
    \renewcommand\institutionfont{\slshape}
    \renewcommand\abstractfont{\large\slshape}
    \renewcommand\partfont{\huge \bfseries}
    \renewcommand\partnamefont{\Huge \bfseries}
    \renewcommand\chapterfont{\huge\bfseries}
    \renewcommand\chaptertitlefont{\Huge\bfseries}
    \renewcommand\chapterauthorfont{\large}
    \renewcommand\sectionfont{\Large\bfseries}
    \renewcommand\subsectionfont{\large\bfseries}
    \renewcommand\subsubsectionfont{\normalsize\bfseries}
    \renewcommand\paragraphfont{\normalsize\bfseries}
    \renewcommand\subparagraphfont{\normalsize\bfseries}
    \renewcommand\translatorfont{}
    \renewcommand\theoremheaderfont{\upshape}
    \renewcommand\theorembodyfont{}
    \renewcommand\itemfont{\slshape}
    \renewcommand\examplefont{}
    \renewcommand\headingstextfont{\slshape}
    \renewcommand\pagenumberfont{}
    \renewcommand\captionheaderfont{}
    \renewcommand\captionbodyfont{}
    \renewcommand\figurefont{}
    \renewcommand\tablefont{}
    \setlength{\partbetweenskip}{20pt}
    \setlength{\chapterbeforeskip}{30pt}
    \setlength{\chapterbetweenskip}{20pt}
    \setlength{\chapterafterskip}{30pt}
    \renewcommand\sectionindent{\z@}
    \renewcommand\sectionbeforeskip{-3.5ex \@plus -1ex \@minus -.2ex}
    \renewcommand\sectionafterskip{2.3ex \@plus.2ex}
    \renewcommand\subsectionindent{\z@}
    \renewcommand\subsectionbeforeskip{-3.25ex \@plus -1ex \@minus -.2ex}
    \renewcommand\subsectionafterskip{1.5ex \@plus.2ex}
    \renewcommand\subsubsectionindent{\z@}
    \renewcommand\subsubsectionbeforeskip{-3.25ex\@plus -1ex \@minus -.2ex}
    \renewcommand\subsubsectionafterskip{1.5ex \@plus .2ex}
    \renewcommand\paragraphindent{\z@}
    \renewcommand\paragraphbeforeskip{3.25ex \@plus1ex \@minus.2ex}
    \renewcommand\paragraphafterskip{-1em}
    \renewcommand\subparagraphindent{\parindent}
    \renewcommand\subparagraphbeforeskip{3.25ex \@plus1ex \@minus .2ex}
    \renewcommand\subparagraphafterskip{-1em}
}
\DeclareOption{slanted}{
    \renewcommand\titlefont{\LARGE}
    \renewcommand\abstractfont{\large\slshape}
    \renewcommand\subtitlefont{\large}
    \renewcommand\authorfont{}
    \renewcommand\degreetitlefont{\large}
    \renewcommand\partfont{\Large}
    \renewcommand\chapterfont{\large}
    \renewcommand\chaptertitlefont{\large}
    \renewcommand\chapterauthorfont{\large}
    \renewcommand\sectionfont{\large\slshape}
    \renewcommand\subsectionfont{\slshape}
    \renewcommand\subsubsectionfont{\slshape}
    \renewcommand\paragraphfont{\slshape}
    \renewcommand\subparagraphfont{\slshape}
    \renewcommand\institutionfont{\slshape}
    \renewcommand\translatorfont{}
    \renewcommand\theoremheaderfont{\upshape}
    \renewcommand\theorembodyfont{}
    \renewcommand\itemfont{\slshape}
    \renewcommand\examplefont{}
    \renewcommand\headingstextfont{\small\slshape}
    \renewcommand\pagenumberfont{\small}
    \renewcommand\captionheaderfont{\slshape\small}
    \renewcommand\captionbodyfont{\small}
    \renewcommand\figurefont{}
    \renewcommand\tablefont{}
    \setlength{\partbetweenskip}{20pt}
    \setlength{\chapterbeforeskip}{30pt}
    \setlength{\chapterbetweenskip}{20pt}
    \setlength{\chapterafterskip}{30pt}
    \renewcommand\sectionindent{\z@}
    \renewcommand\sectionbeforeskip{-3.5ex \@plus -1ex \@minus -.2ex}
    \renewcommand\sectionafterskip{2.3ex \@plus.2ex}
    \renewcommand\subsectionindent{\z@}
    \renewcommand\subsectionbeforeskip{-3.25ex \@plus -1ex \@minus -.2ex}
    \renewcommand\subsectionafterskip{1.5ex \@plus.2ex}
    \renewcommand\subsubsectionindent{\z@}
    \renewcommand\subsubsectionbeforeskip{-3.25ex\@plus -1ex \@minus -.2ex}
    \renewcommand\subsubsectionafterskip{1.5ex \@plus .2ex}
    \renewcommand\paragraphindent{\z@}
    \renewcommand\paragraphbeforeskip{3.25ex \@plus1ex \@minus.2ex}
    \renewcommand\paragraphafterskip{-1em}
    \renewcommand\subparagraphindent{\parindent}
    \renewcommand\subparagraphbeforeskip{3.25ex \@plus1ex \@minus .2ex}
    \renewcommand\subparagraphafterskip{-1em}
}
\DeclareOption{bold}{%
    \renewcommand\titlefont{\LARGE\bfseries}
    \renewcommand\subtitlefont{\large\bfseries}
    \renewcommand\abstractfont{\Large\bfseries}
    \renewcommand\authorfont{}
    \renewcommand\degreetitlefont{\large\bfseries}
    \renewcommand\partfont{\LARGE\bfseries}
    \renewcommand\chapterfont{\LARGE\bfseries}
    \renewcommand\chaptertitlefont{\LARGE\bfseries}
    \renewcommand\chapterauthorfont{\large}
    \renewcommand\sectionfont{\Large\bfseries}
    \renewcommand\subsectionfont{\large\bfseries}
    \renewcommand\subsubsectionfont{\bfseries}
    \renewcommand\paragraphfont{\bfseries}
    \renewcommand\subparagraphfont{\bfseries}
    \renewcommand\translatorfont{}
    \renewcommand\institutionfont{\slshape}
    \renewcommand\theoremheaderfont{\bfseries}
    \renewcommand\theorembodyfont{\itshape}
    \renewcommand\itemfont{\bfseries}
    \renewcommand\examplefont{}
    \renewcommand\headingstextfont{\small\bfseries}
    \renewcommand\pagenumberfont{\small}
    \renewcommand\captionheaderfont{\bfseries}
    \renewcommand\captionbodyfont{}
    \renewcommand\figurefont{}
    \renewcommand\tablefont{}
    \setlength{\partbetweenskip}{20pt}
    \setlength{\chapterbeforeskip}{30pt}
    \setlength{\chapterbetweenskip}{20pt}
    \setlength{\chapterafterskip}{30pt}
    \renewcommand\sectionindent{\z@}
    \renewcommand\sectionbeforeskip{-3.5ex \@plus -1ex \@minus -.2ex}
    \renewcommand\sectionafterskip{2.3ex \@plus.2ex}
    \renewcommand\subsectionindent{\z@}
    \renewcommand\subsectionbeforeskip{-3.25ex \@plus -1ex \@minus -.2ex}
    \renewcommand\subsectionafterskip{1.5ex \@plus.2ex}
    \renewcommand\subsubsectionindent{\z@}
    \renewcommand\subsubsectionbeforeskip{-3.25ex\@plus -1ex \@minus -.2ex}
    \renewcommand\subsubsectionafterskip{1.5ex \@plus .2ex}
    \renewcommand\paragraphindent{\z@}
    \renewcommand\paragraphbeforeskip{3.25ex \@plus1ex \@minus.2ex}
    \renewcommand\paragraphafterskip{-1em}
    \renewcommand\subparagraphindent{\parindent}
    \renewcommand\subparagraphbeforeskip{3.25ex \@plus1ex \@minus .2ex}
    \renewcommand\subparagraphafterskip{-1em}
}
\DeclareOption{sfbold}{%
    \renewcommand\titlefont{\LARGE\sffamily\bfseries}
    \renewcommand\abstractfont{\large\sffamily\bfseries}
    \renewcommand\subtitlefont{\large\sffamily}
    \renewcommand\authorfont{\Large\sffamily\slshape}
    \renewcommand\degreetitlefont{\large\sffamily}
    \renewcommand\partfont{\LARGE\sffamily\bfseries}
    \renewcommand\chapterfont{\LARGE\sffamily\bfseries}
    \renewcommand\chaptertitlefont{\LARGE\sffamily\bfseries}
    \renewcommand\chapterauthorfont{\Large\sffamily\bfseries}
    \renewcommand\sectionfont{\large\sffamily\bfseries}
    \renewcommand\subsectionfont{\large\sffamily\bfseries}
    \renewcommand\subsubsectionfont{\sffamily\bfseries}
    \renewcommand\paragraphfont{\sffamily\bfseries}
    \renewcommand\subparagraphfont{\sffamily}
    \renewcommand\translatorfont{}
    \renewcommand\institutionfont{\sffamily}
    \renewcommand\theoremheaderfont{\sffamily}
    \renewcommand\theorembodyfont{}
    \renewcommand\itemfont{\sffamily}
    \renewcommand\examplefont{}
    \renewcommand\headingstextfont{\small\sffamily}
    \renewcommand\pagenumberfont{\small\rmfamily}
    \renewcommand\captionheaderfont{\sffamily}
    \renewcommand\captionbodyfont{}
    \renewcommand\figurefont{}
    \renewcommand\tablefont{}
    \setlength{\partbetweenskip}{20pt}
    \setlength{\chapterbeforeskip}{30pt}
    \setlength{\chapterbetweenskip}{20pt}
    \setlength{\chapterafterskip}{30pt}
    \renewcommand\sectionindent{\z@}
    \renewcommand\sectionbeforeskip{-3.5ex \@plus -1ex \@minus -.2ex}
    \renewcommand\sectionafterskip{2.3ex \@plus.2ex}
    \renewcommand\subsectionindent{\z@}
    \renewcommand\subsectionbeforeskip{-3.25ex \@plus -1ex \@minus -.2ex}
    \renewcommand\subsectionafterskip{1.5ex \@plus.2ex}
    \renewcommand\subsubsectionindent{\z@}
    \renewcommand\subsubsectionbeforeskip{-3.25ex\@plus -1ex \@minus -.2ex}
    \renewcommand\subsubsectionafterskip{1.5ex \@plus .2ex}
    \renewcommand\paragraphindent{\z@}
    \renewcommand\paragraphbeforeskip{3.25ex \@plus1ex \@minus.2ex}
    \renewcommand\paragraphafterskip{-1em}
    \renewcommand\subparagraphindent{\parindent}
    \renewcommand\subparagraphbeforeskip{3.25ex \@plus1ex \@minus .2ex}
    \renewcommand\subparagraphafterskip{-1em}
}
\ExecuteOptions{%
  letterpaper,%
  10pt,%
  twoside,%
  onecolumn,%
  final,%
  openright,%
  noupper,%
  defaultfonts,%
  nologo}
\ProcessOptions
\input{bk1\@ptsize.clo}
\iflogo\RequirePackage{graphics}\fi
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}
\setlength\parskip{0\p@ \@plus \p@}
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\setcounter{topnumber}{2}
\renewcommand\topfraction{.7}
\setcounter{bottomnumber}{1}
\renewcommand\bottomfraction{.3}
\setcounter{totalnumber}{3}
\renewcommand\textfraction{.2}
\renewcommand\floatpagefraction{.5}
\setcounter{dbltopnumber}{2}
\renewcommand\dbltopfraction{.7}
\renewcommand\dblfloatpagefraction{.5}
\newlength{\headlinespace}
\setlength{\headlinespace}{5pt}
\newcommand{\e@skip}{{\headingstextfont \phantom{y}}}
% So far this few lines below (switch head and foot is only cpbl mods.
% It seems the plain style is covering the entire thesis -- good,
% simple!
% I've only done this for twosided so far!
\if@twoside
  \def\ps@plain{%
    %\let\@oddfoot\@empty\let\@evenfoot\@empty
    \let\@oddhead\@empty\let\@evenhead\@empty
    %\def\@evenhead{%
    \def\@evenfoot{%
      \parbox{\textwidth}{%
        \makebox[\textwidth]{{\pagenumberfont\thepage}\hfill}
        %\if@headline\vspace{\headlinespace}\fi
        }%
    }%
    %\def\@oddhead{%
    \def\@oddfoot{%
      \parbox{\textwidth}{%
        \makebox[\textwidth]{\hfill{\pagenumberfont\thepage}}
        %\if@headline\vspace{\headlinespace}\fi
      }%
    }%
    }%
\else
  \def\ps@plain{%
%    \let\@oddfoot\@empty
    \let\@oddhead\@empty
%    \def\@oddhead{%
    \def\@oddfoot{%
      \parbox{\textwidth}{%
        \makebox[\textwidth]{\hfill{\pagenumberfont\thepage}}%
        \if@headline
          \vspace{\headlinespace}%
        \fi}%
    }%
  }%
\fi
\if@twoside
  \def\ps@headings{%
      \let\@oddfoot\@empty\let\@evenfoot\@empty
      \def\@evenhead{%
        \parbox{\textwidth}{%
          \makebox[\textwidth]{%
            {\pagenumberfont\thepage}\hfill{\headingstextfont\leftmark}%
            \e@skip%
            \if@centerheadline\hfill\fi
          }%
        \if@headline
          \vspace{\headlinespace}%
          \hrule%
        \fi}%
      }%
      \def\@oddhead{%
        \parbox{\textwidth}{%
          \makebox[\textwidth]{%
            \if@centerheadline\hfill\fi%
            {\headingstextfont\rightmark}\e@skip\hfill{\pagenumberfont\thepage}%
          }%
        \if@headline
          \vspace{\headlinespace}%
          \hrule%
        \fi}%
      }%
      \let\@mkboth\markboth
    \def\chaptermark##1{%
      \markboth {
        \ifnum \c@secnumdepth >\m@ne
          \if@mainmatter
            \@toupper{\@chapapp}\
            \if@headcount
               \thechapter. \ %
            \fi
          \fi
        \fi
        \@toupper{##1}}{}}%
    \def\sectionmark##1{%
      \markright {
        \ifnum \c@secnumdepth >\z@
          \if@headcount
            \thesection. \ %
          \fi
        \fi
        \@toupper{##1}}}}
\else
  \def\ps@headings{%
    \let\@oddfoot\@empty
    \def\@oddhead{%
      \parbox{\textwidth}{%
        \makebox[\textwidth]{%
          \if@centerheadline\hfill\fi%
          {\headingstextfont\rightmark}\e@skip\hfill{\pagenumberfont\thepage}%
        }%
      \if@headline%
        \vspace{\headlinespace}%
        \hrule}%
      \fi%
      }%
    \let\@mkboth\markboth
    \def\chaptermark##1{%
      \markright {
        \ifnum \c@secnumdepth >\m@ne
          \if@mainmatter
            \@toupper{\@chapapp\ }
            \if@headcount
              \thechapter. \ %
            \fi
          \fi
        \fi
        \@toupper{##1}}}}
\fi
\def\ps@draft{%
  \let\@oddfoot\@empty\let\@evenfoot\@empty
  \def\@oddhead{%
    \parbox{\textwidth}{%
      \makebox[\textwidth]{%
        {\pagenumberfont\today\ \now\ ---%
          {\headingstextfont\draftname: ``\jobname''}%
          \hfil\e@skip%
          \thepage}%
      }%
      \if@headline
        \vspace{\headlinespace}%
        \hrule%
      \fi
    }%
  }%
  \def\@evenhead{%
    \parbox{\textwidth}{%
      \makebox[\textwidth]{%
        {\pagenumberfont\thepage%
          \e@skip\hfil%
          {\headingstextfont\draftname: ``\jobname''}%
          --- \today\ \now}%
      }%
      \if@headline
        \vspace{\headlinespace}%
        \hrule%
      \fi
    }%
  }%
  \let\@mkboth\@gobbletwo
  \let\chaptermark\@gobble
  \let\sectionmark\@gobble
}
\if@crosshair
  \def\clap#1{\hbox to 0pt{\hss#1\hss}} \newdimen\@crosshairrule
  \@crosshairrule=.24pt \def\@crosshairs{\vbox to
    0pt{\hsize=0pt\baselineskip=0pt\lineskip=0pt \vss \clap{\vrule
        height .125in width \@crosshairrule depth 0pt} \clap{\vrule
        width .25in height \@crosshairrule depth 0pt} \clap{\vrule
        height .125in width \@crosshairrule depth 0pt} \vss}}
  \def\ps@clear{%
    \let\@oddfoot\@empty\let\@evenfoot\@empty
    \def\@oddhead{\hfil\raise\headheight\@crosshairs}
    \let\@evenhead\@oddhead}
\fi
\def\ps@myheadings{%
  \let\@oddfoot\@empty\let\@evenfoot\@empty
  \def\@evenhead{%
    \parbox{\textwidth}{%
      \makebox[\textwidth]{%
        {\pagenumberfont\thepage}\hfil{\headingstextfont\leftmark}%
        \e@skip%
        \if@centerheadline\hfil\fi
      }%
    \if@headline
      \vspace{\headlinespace}%
      \hrule%
    \fi}%
  }%
  \def\@oddhead{%
    \parbox{\textwidth}{%
      \makebox[\textwidth]{%
        \if@centerheadline\hfil\fi%
        {\headingstextfont\rightmark}\e@skip\hfil{\pagenumberfont\thepage}%
      }%
      \if@headline
        \vspace{\headlinespace}%
        \hrule%
      \fi}%
    }%
  \let\@mkboth\@gobbletwo
  \let\chaptermark\@gobble
  \let\sectionmark\@gobble
  }
\newcommand{\@starttitlepagehook}{}
\newcommand{\@AtStartOfTitlepage}{\g@addto@macro\@starttitlepagehook}
\newcommand{\@startabstracthook}{}
\newcommand{\@AtStartOfAbstract}{\g@addto@macro\@startabstracthook}
\newlength{\titlemarginleft}
\newlength{\titlemarginright}
\newlength{\titlemargintop}
\newlength{\titlemarginbottom}

\setlength{\titlemarginleft}{1.5in}
\setlength{\titlemarginright}{1.5in}
\setlength{\titlemargintop}{2in}
\setlength{\titlemarginbottom}{1.5in}
\newcommand*{\signatures}[1]{
  \count0=0
  \loop\ifnum\count0<#1 \advance\count0 by 1
  { \begin{minipage}{4in}
      \par
      \vspace{.25in}
      \hbox to 4in{\dotfill}
    \end{minipage}}
  \endgraf\repeat
  }
\def\@logofile{\@latex@warning@no@line{No \noexpand\logofile\ given}}
\newcommand*{\logofile}[1]{\gdef\@logofile{#1}}
\newcommand\maketitle{
  \cleardoublepage
  \thispagestyle{empty}
  \@startonecolumn
  \setlength{\parindent}{0pt}
  \setlength{\textwidth}{\paperwidth}
  \addtolength{\textwidth}{-\titlemarginleft}
  \addtolength{\textwidth}{-\titlemarginright}
  \setlength{\oddsidemargin}{\titlemarginleft}
  \addtolength{\oddsidemargin}{-1.0in}
  \setlength{\evensidemargin}{\oddsidemargin}

  \setlength{\textheight}{\paperheight}
  \addtolength{\textheight}{-\titlemargintop}
  \addtolength{\textheight}{-\titlemarginbottom}

  \setlength{\topmargin}{\titlemargintop}
  \addtolength{\topmargin}{-1.0in}
  \addtolength{\topmargin}{-\headheight}
  \addtolength{\topmargin}{-\headsep}
  \setlength{\@colht}{\textheight}%
  \setlength{\@colroom}{\textheight}%
  \setlength{\vsize}{\textheight}%
  \setlength{\columnwidth}{\textwidth}%
  \setlength{\hsize}{\columnwidth}%
  \setlength{\linewidth}{\hsize}%
  \renewcommand{\baselinestretch}{1}
  \titlepagefont
  {% Local scope for error calculations.
    \setbox0=\vbox to\textheight{\vspace{0pt plus 1filll}\par%
      \titlepage\par%
      \vspace{0pt plus 1filll}}
    \settoheight{\dimen0}{\copy0}
    \settodepth{\dimen1}{\box0}
    \addtolength{\dimen0}{\dimen1}
    \setlength{\dimen1}{\dimen0}
    \addtolength{\dimen0}{-\textheight}
    \addtolength{\dimen1}{-\paperheight}
    \ifdim0pt<\dimen0
      \ClassWarning{genthesis}
      {Overfull titlepage by \the\dimen0 }
    \fi
    \ifdim0pt<\dimen1
      \ClassError{genthesis}
      {Titlepage larger than paper by \the\dimen1 !!}
    \fi
  }
  \vbox to \textheight{%
    \vspace{0pt plus 1fil minus \titlemargintop}\par%
    \titlepage\par%
    \vspace{0pt plus 1fil minus \titlemarginbottom}%
  }
  \clearpage
  \@endonecolumn
  \normalfont
  \normalsize
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
\global\let\title\relax \global\let\author\relax
\global\let\date\relax
}
\@AtStartOfTitlepage{\setcounter{page}\@ne}
\providecommand{\titlepage}{
  \null\vfil
\newcommand{\exclude}[1]{}
  \begin{center}%
    {\titlefont \@condupper{@uppertitle}{\@title}\par}%
    \vspace{1em}%
    \if@subtitle
      {\subtitlefont \@condupper{@uppersubtitle}{\@subtitle}\par}%
      \vspace{1em}%
    \fi
    by \par%
    \vspace{1em}%
    {\authorfont%
      \@condupper{@upperauthor}{\@author}\par%
    }%
    \if@empty\@previousdegrees\else\vfil\fi%
    \if@empty\@previousdegrees\else\@previousdegrees\fi%
    \vfil
    A THESIS SUBMITTED IN PARTIAL FULFILMENT OF\par%
    THE REQUIREMENTS FOR THE DEGREE OF\par%
    \vspace{1em}
    {\degreetitlefont%
      \@condupper{@upperdegreetitle}{\@degreetitle}\par}%
    \vspace{1em}
    in \par%
    \vspace{1em}
    {\facultyfont \@condupper{@upperfaculty}{\@faculty}\par}%
    \vspace{1em}
    (\@program)\par%
    \vspace{1em plus 1fil minus 0.5em}%
    \@condupper{@upperinstitution}{\@institution}\par%
    \vspace{1em minus 0.5em}%
    \@submitdate\par%
    \vspace{1em minus 0.5em}%
    \@copyrighttext\par%
    \vspace{1em minus 0.5em}%
    \if@empty\@copyrightnotice\else\vfil\@copyrightnotice\fi
    \vspace{1em plus 1fil}%
    \UBCT@signatures\par%
  \end{center}
  \vfil\null
}

\newcommand{\ubcauthorizationform}{
  \thispagestyle{empty}
  \cleardoublepage

  \@startonecolumn
  \edef\@tempbaselinestretch{\baselinestretch}
  \renewcommand{\baselinestretch}{1}
  \selectfont
  In presenting this thesis in partial fulfilment of the requirements
  for an advanced degree at the University of British Columbia, I
  agree that the Library shall make it freely available for reference
  and study. I further agree that permission for extensive copying of
  this thesis for scholarly purposes may be granted by the head of my
  department or by his or her representatives. It is understood that
  copying or publication of this thesis for financial gain shall not
  be allowed without my written permission.

  \vfil
  \begin{flushright}
    (Signature) \rule{2in}{0.5pt}
  \end{flushright}
  \vfil

  \noindent
  \@department

  \vspace{2em}
  \noindent
  \@institution\par
XXXXXXXXXXXXXXXweroiu\par
  \@institutionaddress
 
  \vspace{2em}
  \noindent
  Date \rule{2in}{0.5pt}

  % The authorization form should not count as a page, but this will
  % be taken care of in the abstract.

  \clearpage
  \@endonecolumn
  \edef\baselinestretch{\@tempbaselinestretch}
  \global\let\thanks\relax
  \selectfont
}
\newcommand{\authorizationform}{\ubcauthorizationform}
\newcommand*\chaptermark[1]{}
\setcounter{secnumdepth}{4}
\setcounter{tocdepth}{4}
\newcounter {part}
\newcounter {chapter}
\newcounter {section}[chapter]
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter {subparagraph}[paragraph]
\renewcommand\thepart {\@Roman\c@part}
\renewcommand\thechapter {\@arabic\c@chapter}
\renewcommand\thesection {\thechapter.\@arabic\c@section}
\renewcommand\thesubsection   {\thesection.\@arabic\c@subsection}
\renewcommand\thesubsubsection{\thesubsection .\@arabic\c@subsubsection}
\renewcommand\theparagraph    {\thesubsubsection.\@arabic\c@paragraph}
\renewcommand\thesubparagraph {\theparagraph.\@arabic\c@subparagraph}
\newcommand\@chapapp{\chaptername}
\newcommand\frontmatter{%
    \cleardoublepage
  \@mainmatterfalse
  \pagenumbering{roman}}
\newcommand\mainmatter{%
    \cleardoublepage
  \@mainmattertrue
  \pagenumbering{arabic}}
\newcommand\backmatter{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \@mainmatterfalse}
\newcommand\part{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \thispagestyle{plain}%
  \if@twocolumn
    \onecolumn
    \@tempswatrue
  \else
    \@tempswafalse
  \fi
  \null\vfil
  \secdef\@part\@spart
}
\def\@part[#1]#2{%
  \ifnum \c@secnumdepth >-2\relax
    \refstepcounter{part}%
    \addcontentsline{toc}{part}{\thepart\hspace{1em}\@toctoupper{#1}}%
  \else
    \addcontentsline{toc}{part}{\@toctoupper{#1}}%
  \fi
  \@mkboth{}{}%
  {\centering
    \interlinepenalty \@M
    \normalfont
    \if@partheads
      \ifnum \c@secnumdepth >-2\relax
        {\partnamefont\@toupper{\partname}\nobreakspace\thepart\par}
        \vspace{\partbetweenskip}
      \fi
    \fi
    {\partnamefont #2\par}%
  }%
  \@endpart
}
\def\@spart#1{%
  {\centering
    \interlinepenalty \@M
    \normalfont
    {\partnamefont #1\par}%
  }%
  \@endpart
}
\def\@endpart{\vfil\newpage
  \if@twoside
    \if@openright
      \null
      \thispagestyle{empty}%
      \newpage
    \fi
  \fi
  \if@tempswa
    \twocolumn
  \fi}
\newcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
                    \thispagestyle{plain}%
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\@chapter\@schapter}
\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                       \if@mainmatter
                         \refstepcounter{chapter}%
                         \typeout{\@chapapp\space\thechapter.}%
                         \addcontentsline{toc}{chapter}%
                                   {\protect\numberline{\thechapter}\@toctoupper{#1}}%
                       \else
                         \addcontentsline{toc}{chapter}{\@toctoupper{#1}}%
                       \fi
                    \else
                      \addcontentsline{toc}{chapter}{\@toctoupper{#1}}%
                    \fi
                    \chaptermark{#1}%
                    \addtocontents{lof}{\protect\addvspace{10\p@}}%
                    \addtocontents{lot}{\protect\addvspace{10\p@}}%
                    \if@twocolumn
                      \@topnewpage[\@makechapterhead{#2}]%
                    \else
                      \@makechapterhead{#2}%
                      \@afterheading
                    \fi}
\def\@makechapterhead#1{%
  \setlength{\@tempdima}{\chapterbeforeskip}
  \if@chapterheads
    \if@mainmatter
      \settoheight{\@tempdimb}{
        \chapterfont
        \@toupper{\@chapapp}
        \space
        \thechapter}
      \addtolength{\@tempdima}{-\@tempdimb}
      \addtolength{\@tempdima}{-\chapterbetweenskip}
    \fi
  \fi
  \vspace*{\@tempdima}%
  {\parindent \z@
    \@headingalignment \normalfont
    \interlinepenalty\@M
    \ifnum \c@secnumdepth >\m@ne
      \if@chapterheads
        \if@mainmatter
          {\chapterfont%
            \@toupper{\@chapapp}%
            \if@headcount\space\thechapter\fi
          }%
          \par\nobreak
          \vspace{\chapterbetweenskip}
        \fi
      \fi
    \fi
    \interlinepenalty\@M
    {\chaptertitlefont %
      \if@chapterheads\else
        \if@headcount
          \thechapter.\space%
        \fi
      \fi
      \@toupper{#1}%
    \par\nobreak}
    \vspace*{\chapterafterskip}%
  }
}
\def\@schapter#1{\if@twocolumn
                   \@topnewpage[\@makeschapterhead{#1}]%
                 \else
                   \@makeschapterhead{#1}%
                   \@afterheading
                 \fi}
\def\@makeschapterhead#1{%
  \vspace*{\chapterbeforeskip}%
  {\parindent \z@
    \@headingalignment
    \normalfont
    \interlinepenalty\@M
    {\chaptertitlefont \@toupper{#1}%
    \par\nobreak}
    \vspace*{\chapterafterskip}%
  }
}
\newcommand*{\section}{\@ifstar\@sectionstar\@section}%
\newcommand\@section[2][]{%
  \@startsection {section}{1}{\sectionindent}%
                 {\sectionbeforeskip}%
                 {\sectionafterskip}%
                 {\@headingalignment\normalfont\sectionfont}%
                 [\@toctoupper{\ifx\empty#1\empty%
                   #2%
                 \else%
                   #1%
                 \fi}]{#2}}
\newcommand\@sectionstar[2][]{%
  \@startsection{section}{1}{\sectionindent}%
                {\sectionbeforeskip}%
                {\sectionafterskip}%
                {\@headingalignment\normalfont\sectionfont}*{#2}}
\newcommand*{\subsection}{\@ifstar\@subsectionstar\@subsection}%
\newcommand\@subsection[2][]{%
  \@startsection {subsection}{2}{\subsectionindent}%
                 {\subsectionbeforeskip}%
                 {\subsectionafterskip}%
                 {\@headingalignment\normalfont\subsectionfont}%
                 [\@toctoupper{\ifx\empty#1\empty%
                   #2%
                 \else%
                   #1%
                 \fi}]{#2}}
\newcommand\@subsectionstar[2][]{%
  \@startsection{subsection}{2}{\subsectionindent}%
                {\subsectionbeforeskip}%
                {\subsectionafterskip}%
                {\@headingalignment\normalfont\subsectionfont}*{#2}}
\newcommand*{\subsubsection}{\@ifstar\@subsubsectionstar\@subsubsection}%
\newcommand\@subsubsection[2][]{%
  \@startsection {subsubsection}{3}{\subsubsectionindent}%
                 {\subsubsectionbeforeskip}%
                 {\subsubsectionafterskip}%
                 {\@headingalignment\normalfont\subsubsectionfont}%
                 [\@toctoupper{\ifx\empty#1\empty%
                   #2%
                 \else%
                   #1%
                 \fi}]{#2}}
\newcommand\@subsubsectionstar[2][]{%
  \@startsection{subsubsection}{3}{\subsubsectionindent}%
                {\subsubsectionbeforeskip}%
                {\subsubsectionafterskip}%
                {\@headingalignment\normalfont\subsubsectionfont}*{#2}}
\newcommand*{\paragraph}{\@ifstar\@paragraphstar\@paragraph}%
\newcommand\@paragraph[2][]{%
  \@startsection {paragraph}{4}{\paragraphindent}%
                 {\paragraphbeforeskip}%
                 {\paragraphafterskip}%
                 {\@headingalignment\normalfont\paragraphfont}%
                 [\@toctoupper{\ifx\empty#1\empty%
                   #2%
                 \else%
                   #1%
                 \fi}]{#2}}
\newcommand\@paragraphstar[2][]{%
  \@startsection{paragraph}{4}{\paragraphindent}%
                {\paragraphbeforeskip}%
                {\paragraphafterskip}%
                {\@headingalignment\normalfont\paragraphfont}*{#2}}
\newcommand*{\subparagraph}{\@ifstar\@subparagraphstar\@subparagraph}%
\newcommand\@subparagraph[2][]{%
  \@startsection {subparagraph}{5}{\subparagraphindent}%
                 {\subparagraphbeforeskip}%
                 {\subparagraphafterskip}%
                 {\@headingalignment\normalfont\subparagraphfont}%
                 [\@toctoupper{\ifx\empty#1\empty%
                   #2%
                 \else%
                   #1%
                 \fi}]{#2}}
\newcommand\@subparagraphstar[2][]{%
  \@startsection{subparagraph}{5}{\subparagraphindent}%
                {\subparagraphbeforeskip}%
                {\subparagraphafterskip}%
                {\@headingalignment\normalfont\subparagraphfont}*{#2}}
\if@twocolumn
  \setlength\leftmargini  {2em}
\else
  \setlength\leftmargini  {2.5em}
\fi
\leftmargin  \leftmargini
\setlength\leftmarginii  {2.2em}
\setlength\leftmarginiii {1.87em}
\setlength\leftmarginiv  {1.7em}
\if@twocolumn
  \setlength\leftmarginv  {.5em}
  \setlength\leftmarginvi {.5em}
\else
  \setlength\leftmarginv  {1em}
  \setlength\leftmarginvi {1em}
\fi
\setlength  \labelsep  {.5em}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{\@alph\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
\newcommand\labelenumi{\theenumi.}
\newcommand\labelenumii{(\theenumii)}
\newcommand\labelenumiii{\theenumiii.}
\newcommand\labelenumiv{\theenumiv.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}
\newcommand\labelitemi{\textbullet}
\newcommand\labelitemii{\normalfont\bfseries \textendash}
\newcommand\labelitemiii{\textasteriskcentered}
\newcommand\labelitemiv{\textperiodcentered}
\newenvironment{description}
{\list{}{\labelwidth\z@ \itemindent-\leftmargin
    \let\makelabel\descriptionlabel}}
{\endlist}
\newcommand*\descriptionlabel[1]{\hspace\labelsep
  \normalfont\bfseries #1}
\newenvironment{abstract}{%
  \cleardoublepage
  \if@twocolumn\@startonecolumn\fi
  \@startabstracthook
    \chapter{\abstractname}
}
{\clearpage\@endonecolumn}
\newenvironment{verse}
               {\let\\\@centercr
                \list{}{\itemsep      \z@
                        \itemindent   -1.5em%
                        \listparindent\itemindent
                        \rightmargin  \leftmargin
                        \advance\leftmargin 1.5em}%
                \item\relax}
               {\endlist}
\newenvironment{quotation}
               {\list{}{\listparindent 1.5em%
                        \itemindent    \listparindent
                        \rightmargin   \leftmargin
                        \parsep        \z@ \@plus\p@}%
                \item\relax}
               {\endlist}
\newenvironment{quote}
               {\list{}{\rightmargin\leftmargin}%
                \item\relax}
               {\endlist}
\newcommand\appendix{\par
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \gdef\@chapapp{\appendixname}%
  \gdef\thechapter{\@Alph\c@chapter}}
\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
\@addtoreset {equation}{chapter}
\renewcommand\theequation
  {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@equation}
\newcounter{figure}[chapter]
\renewcommand \thefigure
     {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{{\figurefont\figurename\nobreakspace\thefigure}}
\newenvironment{figure}
               {\@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\@dblfloat{figure}}
               {\end@dblfloat}
\newcounter{table}[chapter]
\renewcommand \thetable
     {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{{\tablefont\tablename\nobreakspace\thetable}}
\newenvironment{table}
               {\@float{table}}
               {\end@float}
\newenvironment{table*}
               {\@dblfloat{table}}
               {\end@dblfloat}
\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{10\p@}
\setlength\belowcaptionskip{0\p@}
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{{\captionheaderfont #1:} {\captionbodyfont #2}}%
  \ifdim \wd\@tempboxa >\hsize
    \if@hangingcaptions
      \@hangfrom{\captionheaderfont #1: }{\captionbodyfont #2\par}%
    \else
      {\captionheaderfont #1: }{\captionbodyfont #2\par}%
    \fi
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}
\newcommand\@pnumwidth{1.55em}
\newcommand\@tocrmarg{2.55em}
\newcommand\@dotsep{4.5}
\setcounter{tocdepth}{2}
\newcommand\tableofcontents{%
  \cleardoublepage
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter{\contentsname}
    \@starttoc{toc}%
    \if@restonecol\twocolumn\fi
    }
\newcommand*\l@part[2]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty{-\@highpenalty}%
    \addvspace{2.25em \@plus\p@}%
    \setlength\@tempdima{3em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      {\leavevmode
       \large \bfseries #1\hfil \hb@xt@\@pnumwidth{\hss #2}}\par
       \nobreak
         \global\@nobreaktrue
         \everypar{\global\@nobreakfalse\everypar{}}%
    \endgroup
  \fi}
\newcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 1.0em \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      {\bfseries #1}\nobreak%
       \if@chaptertocdots
         \leaders\hbox{$\m@th%
           \mkern \@dotsep mu\hbox{.}\mkern \@dotsep%
           mu$}\hfil
       \else
         \hfil
       \fi
      \hb@xt@\@pnumwidth{\hfil\normalfont \normalcolor #2}\par%
      \penalty\@highpenalty
    \endgroup
  \fi}
\newcommand*\l@section[2]{%
  \@dottedtocline{1}{1.5em}{2.3em}{#1}{#2}%
}
\newcommand*\l@subsection[2]{\@dottedtocline{2}{3.8em}{3.2em}{#1}{#2}}
\newcommand*\l@subsubsection[2]{\@dottedtocline{3}{7.0em}{4.1em}{#1}{#2}}
\newcommand*\l@paragraph[2]{\@dottedtocline{4}{10em}{5em}{#1}{#2}}
\newcommand*\l@subparagraph[2]{\@dottedtocline{5}{12em}{6em}{#1}{#2}}
\newcommand\listoffigures{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter{\listfigurename}%
    \@starttoc{lof}%
    \if@restonecol\twocolumn\fi
    }
\newcommand*\l@figure{\@dottedtocline{1}{\lofindent}{\loflabelwidth}}
\newcommand\listoftables{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter{\listtablename}%
    \@starttoc{lot}%
    \if@restonecol\twocolumn\fi
    }
\newcommand*\l@table{\@dottedtocline{1}{\lotindent}{\lotlabelwidth}}
\newenvironment{thebibliography}[1]{}{}
\AtBeginDocument{
\newdimen\bibindent
\setlength\bibindent{1.5em}
\renewenvironment{thebibliography}[1]
{
  \chapter*{\bibname}%
  \addcontentsline{toc}{chapter}{\@toctoupper{\bibname}}%
  \list{\@biblabel{\@arabic\c@enumiv}}%
  {\settowidth\labelwidth{\@biblabel{#1}}%
    \leftmargin\labelwidth
    \advance\leftmargin\labelsep
    \@openbib@code
    \usecounter{enumiv}%
    \let\p@enumiv\@empty
    \renewcommand\theenumiv{\@arabic\c@enumiv}}%
  \sloppy
  \clubpenalty4000
  \@clubpenalty \clubpenalty
  \widowpenalty4000%
  \sfcode`\.\@m}
{\def\@noitemerr
  {\@latex@warning{Empty `thebibliography' environment}}%
  \endlist}
\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty
} % AtBeginDocument
\newenvironment{theindex}
               {\if@twocolumn
                  \@restonecolfalse
                \else
                  \@restonecoltrue
                \fi
                \columnseprule \z@
                \columnsep 35\p@
                \twocolumn[\@makeschapterhead{\indexname}]%
                \@mkboth{\@toupper{\indexname}}{\@toupper{\indexname}}%
                \thispagestyle{plain}\parindent\z@
                \parskip\z@ \@plus .3\p@\relax
                \let\item\@idxitem}
               {\if@restonecol\onecolumn\else\clearpage\fi}
\newcommand\@idxitem{\par\hangindent 40\p@}
\newcommand\subitem{\@idxitem \hspace*{20\p@}}
\newcommand\subsubitem{\@idxitem \hspace*{30\p@}}
\newcommand\indexspace{\par \vskip 10\p@ \@plus5\p@ \@minus3\p@\relax}
\renewcommand\footnoterule{%
  \kern-3\p@
  \hrule\@width.4\columnwidth
  \kern2.6\p@}
\@addtoreset{footnote}{chapter}
\newcommand\@makefntext[1]{%
    \parindent 1em%
    \noindent
    \hb@xt@1.8em{\hss\@makefnmark}#1}
\newcommand\contentsname{Contents}
\newcommand\listfigurename{List of Figures}
\newcommand\listtablename{List of Tables}
\newcommand\bibname{Bibliography}
\newcommand\indexname{Index}
\newcommand\figurename{Figure}
\newcommand\tablename{Table}
\newcommand\partname{Part}
\newcommand\chaptername{Chapter}
\newcommand\appendixname{Appendix}
\newcommand\abstractname{Abstract}
\newcommand\draftname{Preliminary Draft}
\def\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}
\setlength\columnsep{10\p@}
\setlength\columnseprule{0\p@}
\if@final
  \if@runningheaders
    \pagestyle{headings}
  \else
    \pagestyle{plain}
  \fi
\else
  \pagestyle{draft}
\fi
\pagenumbering{arabic}
\if@twoside
\else
  \raggedbottom
\fi
\if@twocolumn
  \twocolumn
  \sloppy
  \flushbottom
\else
  \onecolumn
\fi
\newcommand{\committeespacing}{1.5}
\AtBeginDocument{
  \renewcommand\baselinestretch{%
    \if@committee%
      \committeespacing%
    \else 1%
    \fi%
  }%
}%
\endinput
%%
%% End of file `genthesis.cls'.
