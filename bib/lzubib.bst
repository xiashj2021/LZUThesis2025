% BibTeX standard bibliography style `lzubib.bst' derived from `bnubib.bst'
% 2022.1.20 对齐、url、期刊
% 2020.5.9 修复作者问题
% 2017/9/16
ENTRY
  { address
    author
    booktitle
    chapter
    edition
    editor
    doi
    howpublished
    institution
    journal
    key
    lang
    language % 在bib文件中设置语言，来切换中英文作者大于三人时的 “等”和"et.al"，使用zotero导出bib时可以自动生成
    month
    note
    number
    organization
    pages
    publisher
    school
    series
    title
    type
    volume
    year
    url
    nationality
    date
  }
  {}
  { label }

INTEGERS { output.state before.all mid.sentence after.sentence after.block }
INTEGERS { punctuation.state punctuation.no }
FUNCTION {not}
{   { #0 }
    { #1 }
  if$
}

FUNCTION {and}
{   'skip$
    { pop$ #0 }
  if$
}

FUNCTION {or}
{   { pop$ #1 }
    'skip$
  if$
}

FUNCTION {init.state.consts}
{ #0 'before.all :=
  #1 'mid.sentence :=
  #2 'after.sentence :=
  #3 'after.block :=
}

STRINGS { s t }

FUNCTION {output.nonnull}
{ 's :=
  output.state mid.sentence =
    { ", " * write$ }
    { output.state after.block =
    { add.period$ write$
%      newline$
      " " write$
    }
    { output.state before.all =
        'write$
        { add.period$ " " * write$ }
      if$
    }
      if$
      mid.sentence 'output.state :=
    }
  if$
  s
}

FUNCTION {output.year}
{ 't :=
  number empty$
  volume empty$
  and
    { add.period$ write$ }
    { ", " * write$ }
  if$
  t
}

STRINGS {z}
FUNCTION {remove.dots}
{ 'z :=
  ""
  { z empty$ not}
  { z #1 #1 substring$
    z #2 global.max$ substring$ 'z :=
    duplicate$ "." = 'pop$
      { * }
    if$
  }
  while$
  %z
}

FUNCTION {bibinfo.check}
{ swap$
  duplicate$ missing$
    {
      pop$ pop$
      ""
    }
    { duplicate$ empty$
        {
          swap$ pop$
        }
        { swap$
          pop$
        }
      if$
    }
  if$
}

FUNCTION {format.note}
{
 note empty$
    { "" }
    { note #1 #1 substring$
      duplicate$ "{" =
        'skip$
        { output.state mid.sentence =
          { "l" }
          { "u" }
        if$
        change.case$
        }
      if$
      note #2 global.max$ substring$ * "note" bibinfo.check
    }
  if$
}

FUNCTION {output}
{ duplicate$ empty$
    'pop$
    'output.nonnull
  if$
}

FUNCTION {output.check}
{ 't :=
  duplicate$ empty$
    { pop$ "empty " t * " in " * cite$ * warning$ }
    'output.nonnull
  if$
}

FUNCTION {output.bibitem}
{ newline$
  "\bibitem{" write$
  cite$ write$
  "}" write$
  newline$
  ""
  before.all 'output.state :=
}

%FUNCTION {fin.entry}
%{ duplicate$ empty$
%    'pop$
%    'write$
%  if$
%  newline$
%  "\thudot" write$
%  newline$
%}

 FUNCTION {fin.entry}
 { add.period$   
   write$
   %remove.dots
   newline$
 }

% FUNCTION {fin.entry}
% { duplicate$ empty$
%     'pop$
%     'write$
%   if$
%   newline$
% }

FUNCTION {new.block}
{ output.state before.all =
    'skip$
    { after.block 'output.state := }
  if$
}

FUNCTION {new.sentence}
{ output.state after.block =
    'skip$
    { output.state before.all =
    'skip$
    { after.sentence 'output.state := }
      if$
    }
  if$
}


FUNCTION {new.block.checka}
{ empty$
    'skip$
    'new.block
  if$
}

FUNCTION {new.block.checkb}
{ empty$
  swap$ empty$
  and
    'skip$
    'new.block
  if$
}

FUNCTION {new.sentence.checka}
{ empty$
    'skip$
    'new.sentence
  if$
}

FUNCTION {new.sentence.checkb}
{ empty$
  swap$ empty$
  and
    'skip$
    'new.sentence
  if$
}

FUNCTION {field.or.null}
{ duplicate$ empty$
    { pop$ "" }
    'skip$
  if$
}

FUNCTION {emphasize}
{ duplicate$ empty$
    { pop$ "" }
    { "{\emph{" swap$ * "}}" * }
  if$
}

INTEGERS { nameptr namesleft numnames }

FUNCTION {bbl.etal}
{ "et~al." }

FUNCTION {bbl.cn.etal}
{ "等." }

FUNCTION {format.lang}
{ lang empty$
    'skip$
    'skip$
  if$
 }

FUNCTION {format.names}
{ 's :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr 
      "{vv~}{ll}{ f{~}}{ jj}" 
      format.name$ 
      't :=
      nameptr #1 >
        {
          nameptr #3
          #1 + =
          numnames #3
          > and
            { "others" 't :=
              #1 'namesleft := }
            'skip$
          if$
          namesleft #1 >
            { ", " * t * }
            {
              s nameptr "{ll}" format.name$ duplicate$ "others" =
                { 't := }
                { pop$ }
              if$
              "," *
              t "others" =
                {
                  language empty$
                  {                    
                    " " * bbl.etal *
                  }
                  {                  
                    language "中文" =
                    language "zh" =
                    or
                    {" " * bbl.cn.etal *}
                    {" " * bbl.etal *}
                    if$
                  }
                  if$
                }
                { " " * t * }
              if$
            }
          if$
        }
	't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

FUNCTION {format.authors}
{ author empty$
    { "" }
    { author format.names }
  if$
}

FUNCTION {editors.names}
{ lang empty$
    { ", (eds.)" }
    { ", 编" }
  if$
}


FUNCTION {format.editors}
{ editor empty$
    { "" }
    { editor format.names
    %  editor num.names$ #1 >
    %{ ", editors" * }
    %{ ", editor" * }
    %  if$
     editors.names *
    }
  if$
}

FUNCTION {format.title}
{ title empty$
    { "" }
     { "{ " title * "}" * }
  if$
}

FUNCTION {n.dashify}
{ 't :=
  ""
    { t empty$ not }
    { t #1 #1 substring$ "-" =
    { t #1 #2 substring$ "--" = not
        { "--" *
          t #2 global.max$ substring$ 't :=
        }
        {   { t #1 #1 substring$ "-" = }
        { "-" *
          t #2 global.max$ substring$ 't :=
        }
          while$
        }
      if$
    }
    { t #1 #1 substring$ *
      t #2 global.max$ substring$ 't :=
    }
      if$
    }
  while$
}

FUNCTION {format.date}
{ year empty$
    { month empty$
    { "" }
    { "there's a month but no year in " cite$ * warning$
      month
    }
      if$
    }
    { month empty$
    'year
    { month ", " * year * }
      if$
    }
  if$
}

FUNCTION {format.btitle}
{ title emphasize
}

FUNCTION {tie.or.space.connect}
{ duplicate$ text.length$ #3 <
    { "~" }
    { " " }
  if$
  swap$ * *
}

FUNCTION {either.or.check}
{ empty$
    'pop$
    { "can't use both " swap$ * " fields in " * cite$ * warning$ }
  if$
}

FUNCTION {format.bvolume}
{ volume empty$
    { "" }
    { "volume" volume tie.or.space.connect
      series empty$
    'skip$
    { " of " * series emphasize * }
      if$
      "volume and number" number either.or.check
    }
  if$
}

FUNCTION {format.number.series}
{ volume empty$
    { number empty$
    { series field.or.null }
    { output.state mid.sentence =
        { "number" }
        { "Number" }
      if$
      number tie.or.space.connect
      series empty$
        { "there's a number but no series in " cite$ * warning$ }
        { " in " * series * }
      if$
    }
      if$
    }
    { "" }
  if$
}

FUNCTION {format.edition}
{ edition empty$
    { "" }
    { output.state mid.sentence =
    { edition "l" change.case$ " ed." * }
    { edition "t" change.case$ " ed." * }
      if$
    }
  if$
}


FUNCTION {format.url}
{ url empty$
    { "" }
    { new.block " {\url{" url * "}}" * }
  if$
}


INTEGERS { multiresult }

FUNCTION {multi.page.check}
{ 't :=
  #0 'multiresult :=
    { multiresult not
      t empty$ not
      and
    }
    { t #1 #1 substring$
      duplicate$ "-" =
      swap$ duplicate$ "," =
      swap$ "+" =
      or or
    { #1 'multiresult := }
    { t #2 global.max$ substring$ 't := }
      if$
    }
  while$
  multiresult
}

FUNCTION {format.pages}
{ pages empty$
    { "" }
    { pages multi.page.check
    { "" pages n.dashify tie.or.space.connect }
    { "" pages tie.or.space.connect }
      if$
    }
  if$
}

FUNCTION {format.vol.num.pages}
{ volume field.or.null
  number empty$
    'skip$
    { "(" number * ")" * *
      volume empty$
    { "there's a number but no volume in " cite$ * warning$ }
    'skip$
      if$
    }
  if$
  pages empty$
    'skip$
    { duplicate$ empty$
    { pop$ format.pages }
    { ":" * pages n.dashify * }
      if$
    }
  if$
}

FUNCTION {format.chapter.pages}
{ chapter empty$
    { "" }
    { type empty$
      { "chapter" }
      { type "l" change.case$ }
    if$
    chapter tie.or.space.connect
    pages empty$
      'skip$
      { ", " * format.pages * }
    if$
    }
  if$
}

FUNCTION {collection.in}
{ lang empty$
    { "In: " }
    { "见: " }
  if$
}

FUNCTION {format.in.ed.booktitle}
{ booktitle empty$
    { "" }
    { editor empty$
    { lang empty$
        { "Proceedings of " booktitle * }
        { " " booktitle * }
      if$
    }
    { lang empty$
        { collection.in format.editors * ". Proceedings of " * booktitle * }
        { collection.in format.editors * ". " * booktitle * }
      if$
    }
      if$
    }
  if$
}

FUNCTION {empty.misc.check}
{ author empty$ title empty$ howpublished empty$
  month empty$ year empty$ note empty$
  and and and and and
    { "all relevant fields are empty in " cite$ * warning$ }
    'skip$
  if$
}

FUNCTION {format.thesis.type}
{ type empty$
    'skip$
    { pop$
      type "t" change.case$
    }
  if$
}

FUNCTION {format.tr.number}
{ type empty$
    { "Technical Report" }
    'type
  if$
  number empty$
    { "t" change.case$ }
    { number tie.or.space.connect }
  if$
}


FUNCTION {format.article.crossref}
{ key empty$
    { journal empty$
      { "need key or journal for " cite$ * " to crossref " * crossref *
        warning$
        ""
      }
      { "In {\em " journal * "\/}" * }
      if$
    }
    { "In " key * }
  if$
  " \cite{" * crossref * "}" *
}

FUNCTION {format.crossref.editor}
{ editor #1 "{ll }{f{~}}" format.name$
  editor num.names$ duplicate$
  #2 >
    { pop$ " et~al." * }
    { #2 <
    'skip$
    { editor #2 "{ll }{f{~}}" format.name$ "others" =
        { " et~al." * }
        { " and " * editor #2 "{ll }{f{~}}" format.name$ * }
      if$
    }
      if$
    }
  if$
}

FUNCTION {format.book.crossref}
{ volume empty$
    { "empty volume in " cite$ * "'s crossref of " * crossref * warning$
      "In "
    }
    { "Volume" volume tie.or.space.connect
      " of " *
    }
  if$
  editor empty$
  editor field.or.null author field.or.null =
  or
    { key empty$
    { series empty$
        { "need editor, key, or series for " cite$ * " to crossref " *
          crossref * warning$
          "" *
        }
        { "{\em " * series * "\/}" * }
      if$
    }
    { key * }
      if$
    }
    { format.crossref.editor * }
  if$
  " \cite{" * crossref * "}" *
}

FUNCTION {format.incoll.inproc.crossref}
{ editor empty$
  editor field.or.null author field.or.null =
  or
    { key empty$
    { booktitle empty$
        { "need editor, key, or booktitle for " cite$ * " to crossref " *
          crossref * warning$
          ""
        }
        { "In {\em " booktitle * "\/}" * }
      if$
    }
    { "In " key * }
      if$
    }
    { "In " format.crossref.editor * }
  if$
  " \cite{" * crossref * "}" *
}

FUNCTION {format.address.publisher}
{ address empty$
    { publisher empty$
    { "" }
    { "there's a publisher but no address in " cite$ * warning$
      publisher
    }
      if$
    }
    { publisher empty$
    'address
    { address ": " * publisher * }
      if$
    }
  if$
}

FUNCTION {format.address.school}
{ address empty$
    { school empty$
    { "" }
    { "there's a school but no address in " cite$ * warning$
      school
    }
      if$
    }
    { school empty$
    'address
    { address ": " * school * }
      if$
    }
  if$
}


FUNCTION {format.title.type}
{ title empty$
    { type empty$
        { "" }
        { "there's a type but no title in " cite$ * warning$
          type
        }
      if$
    }
    { type empty$
        'title
        { title ": " * type * }
      if$
    }
  if$
}

FUNCTION {add.blank2}
{
  "" *
  before.all 'output.state :=
}

FUNCTION {output.nopunct}
{
  punctuation.no 'punctuation.state :=
  output.nonnull
}

FUNCTION {doi.base.command}
{
  "\doibase "
}

FUNCTION {noop.command}
{
  "\href@noop "
}

FUNCTION {href.command}
{
  "\href "
}

FUNCTION {link.tag.open}
{
  doi duplicate$ empty$
    {
      pop$
      url duplicate$ empty$
        {
          pop$ "" noop.command
        }{
          href.command
        }
      if$
    }
    {
      doi.base.command swap$ * 
      href.command
    }
  if$
  "{" * swap$ * "} {" *
}

FUNCTION {link.tag.shut}
{
  "}"
}

FUNCTION {link.open}
{
  link.tag.open output.nopunct
}

FUNCTION {link.shut}
{
  link.tag.shut *
}



FUNCTION {book} 
{ output.bibitem
  author empty$
    { format.editors "author and editor" output.check }
    { format.authors output.nonnull
      crossref missing$
    { "author and editor" editor either.or.check }
    'skip$
      if$
    }
  if$
  new.block
  link.open
  format.title add.blank2 emphasize "[M]" * "title" output.check
  link.shut
  crossref missing$
    { format.bvolume output
      new.block
      format.number.series output
      %new.sentence
      %format.address.publisher output
    }
    { new.block
      format.book.crossref output.nonnull
    }
  if$
  format.edition output
  format.address.publisher output
  pages empty$
    { format.date "year" output.check 
      % new.sentence
      % format.pages output
    }
    { format.date "." * format.pages * output }
  if$  
  fin.entry
}

FUNCTION {article}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.title "[J]" * "title" output.check
  new.block
  crossref missing$
    { 
      journal emphasize "journal" output.check
      % journal "journal" output.check
      %format.date output
      %new.block
      year output
      format.vol.num.pages output.year
    }
    { format.article.crossref output.nonnull
      format.pages output
    }
  if$
  new.block
  format.note output  
  fin.entry
}

FUNCTION {booklet}
{ output.bibitem
  format.authors output
  new.block
  format.title emphasize "[M]" * "title" output.check
  format.address.publisher output
  format.date output
  new.block
  note output
  fin.entry
}

FUNCTION {inbook}
{ output.bibitem
  author empty$
    { format.editors "[M]" * "author and editor" output.check }
    { format.authors output.nonnull
      crossref missing$
    { "author and editor" editor either.or.check
      new.block
      format.title "[M]" * "title" output.check}
    'skip$
      if$
    }
  if$
  new.block
  booktitle emphasize "booktitle" output.check
  crossref missing$
    { format.bvolume output
      %format.chapter.pages "chapter and pages" output.check
      new.block
      format.number.series output
      new.sentence
      format.address.publisher output
    }
    { format.chapter.pages "chapter and pages" output.check
      new.block
      format.book.crossref output.nonnull
    }
  if$
  format.edition output
  pages empty$
    { format.date output }
    { format.date "." * format.pages * output }
  if$
  % format.date ":" * format.pages * output
  fin.entry
}

FUNCTION {incollection}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.title "[C]" * "title" output.check
  new.block
  crossref missing$
    { format.in.ed.booktitle emphasize "booktitle" output.check
      %format.bvolume output
      format.number.series output
      format.chapter.pages output
      new.sentence
      format.address.publisher output
      %address output
      %publisher "publisher" output.check
      %format.edition output
      format.date "year" output.check
      format.date ". " * format.pages * output
      % format.date ":" * format.pages * output
    }
    { format.incoll.inproc.crossref output.nonnull
      format.chapter.pages output
    }
  if$
  % new.block
  % note output
  fin.entry
}

FUNCTION {inproceedings}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.title "[C]. " * booktitle emphasize * "booktitle" output.check
  new.block
  format.address.publisher output
  crossref missing$
    { 
      address empty$
    { 
      year output
    }
    { 
      year output
      new.sentence
      %publisher output
    }
      if$
      new.block
      format.pages output
      %remove.dots
    }
    { format.incoll.inproc.crossref output.nonnull
      format.pages output
    }
  if$
  new.block
  format.note output  
  fin.entry
}

FUNCTION {conference} { inproceedings }

FUNCTION {patent}
{ output.bibitem
  format.authors output
  new.block
  format.title "[P]" * "title" output.check
  new.block
  nationality ":" * number * output
  date output
  new.block
  format.url output
  new.block
  note output
  fin.entry
}

FUNCTION {newspaper}
{ output.bibitem
  format.authors output
  new.block
  format.title "[N]" * "title" output.check
  new.block
  journal emphasize "journal" output.check
  date "(" number * ")" * * output
  new.block
  format.url output
  new.block
  note output
  fin.entry
}

FUNCTION {standard}
{ output.bibitem
  number output
  format.title "[S]" * "title" output.check
  new.block
  format.url output
  new.block
  note output
  fin.entry
}

FUNCTION {online}
{ output.bibitem
  format.authors output
  new.block
  format.title emphasize "[EB/OL]" * "title" output.check
  new.block
  format.url output
  new.block
  note output
  fin.entry
  empty.online.check
}

FUNCTION {program}
{ output.bibitem
  format.authors output
  new.block
  format.title emphasize "[CP/OL]" * "title" output.check
  new.block
  format.url output
  new.block
  note output
  fin.entry
  empty.program.check
}

FUNCTION {manual}
{ output.bibitem
  author empty$
    { institution empty$
    'skip$
    { institution output.nonnull
      address output
    }
      if$
    }
    { format.authors output.nonnull }
  if$
  new.block
  format.title "[A]" * "title" output.check
  new.block
  author empty$
    { institution empty$
    { address new.block.checka
      address output
    }
    'skip$
      if$
    }
    { institution address new.block.checkb
      institution output
      address output
    }
  if$
  format.edition output
  format.date output
  new.block
  % format.url output
  note output
  fin.entry
}


FUNCTION {mastersthesis}
{ output.bibitem
  format.authors "author" add.period$ output.check
  new.block
  format.title emphasize "[D]" * "title" output.check
  new.block
  format.address.school output
  %format.madd "address" output.check
  %school "school" output.check  
  format.date "year" output.check
  new.block
  note output
  fin.entry
}

FUNCTION {misc}
{ output.bibitem
  format.authors output
  new.block
  format.title "[Z/OL]" * "title" output.check
  new.block
  crossref missing$
    { 
      journal emphasize "journal" output.check
      % journal "journal" output.check
      %format.date output
      %new.block
      year output
      % format.vol.num.pages output.year
      new.block
    }
    { format.article.crossref output.nonnull
      new.block
      % format.pages output
    }
  if$
  format.url output
  new.block
  note output
  fin.entry
}


FUNCTION {phdthesis}
{ output.bibitem
  format.authors "author" add.period$ output.check
  new.block
  % format.title remove.dots ": " * phdthesis.type * output
  format.title emphasize "[D]" * "title" output.check
  new.block
  format.address.school output
  %address output
  %school "school" output.check  
  format.date "year" output.check
  new.block
  note output
  fin.entry
}

FUNCTION {proceedings}
{ output.bibitem
  editor empty$
    { organization output }
    { format.editors output.nonnull }
  if$
  new.block
  format.btitle "[C]" * "title" output.check
  format.bvolume output
  format.number.series output
  address empty$
    { editor empty$
    { publisher new.sentence.checka }
    { organization publisher new.sentence.checkb
      organization output
    }
      if$
      publisher output
      format.date "year" output.check
    }
    { address output.nonnull
      format.date "year" output.check
      new.sentence
      editor empty$
    'skip$
    { organization output }
      if$
      publisher output
    }
  if$
  new.block
  note output
  fin.entry
}

FUNCTION {techreport}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.title "[R/OL]" * "title" output.check
  new.block
  % format.tr.number output.nonnull
  institution "institution" output.check
  address output
  format.date "year" output.check
  format.url output
  new.block
  note output
  fin.entry
}

FUNCTION {unpublished}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.title emphasize "[Z]" * "title" output.check
  new.block
  note "note" output.check
  format.date output
  fin.entry
}

FUNCTION {artionline}
{ output.bibitem
  format.authors output
  new.block
  format.title "[J/OL]" * "title" output.check
  new.block
  crossref missing$
    { 
      journal emphasize "journal" output.check
      % journal "journal" output.check
      %format.date output
      %new.block
      % year output
      % format.vol.num.pages output.year
      format.pages output
      new.block
    }
    { format.article.crossref output.nonnull
      new.block
      format.pages output
    }
  if$
  format.url output
  new.block
  note output
  fin.entry
}

FUNCTION {default.type} {article}

MACRO {jan} {"January"}

MACRO {feb} {"February"}

MACRO {mar} {"March"}

MACRO {apr} {"April"}

MACRO {may} {"May"}

MACRO {jun} {"June"}

MACRO {jul} {"July"}

MACRO {aug} {"August"}

MACRO {sep} {"September"}

MACRO {oct} {"October"}

MACRO {nov} {"November"}

MACRO {dec} {"December"}

READ

STRINGS { longest.label }

INTEGERS { number.label longest.label.width }

FUNCTION {initialize.longest.label}
{ "" 'longest.label :=
  #1 'number.label :=
  #0 'longest.label.width :=
}

FUNCTION {longest.label.pass}
{ number.label int.to.str$ 'label :=
  number.label #1 + 'number.label :=
  label width$ longest.label.width >
    { label 'longest.label :=
      label width$ 'longest.label.width :=
    }
    'skip$
  if$
}

FUNCTION {init.bib}
{
  "\makeatletter" write$ newline$
  "\providecommand " noop.command "[0]{\@secondoftwo}%" * * write$ newline$
}

EXECUTE {initialize.longest.label}

ITERATE {longest.label.pass}
%参考文献内容为五号字（英文用Times New Roman体，10.5磅），宋体，行距16磅，段前段后0磅。
FUNCTION {begin.bib}
{ preamble$ empty$
    'skip$
    { preamble$ write$ newline$ }
  if$
  "\providecommand{\href}[2]{#2}"
  "\begingroup\zihao{5}\begin{thebibliography}{" * longest.label  * 
  "}\linespread{1}\selectfont\setlength{\baselineskip}{16pt}\setlength{\parskip}{0pt}" * write$ newline$ 
  init.bib
}

EXECUTE {begin.bib}

EXECUTE {init.state.consts}

ITERATE {call.type$}

FUNCTION {end.bib}
{ newline$
  "\end{thebibliography}\endgroup" write$ newline$
}

EXECUTE {end.bib}
