# LZUThesis2025
Undergraduate Thesis / Capstone Project LaTeX Template Design for Lanzhou University

## How to use
1. Open the [Overleaf](https://www.overleaf.com/) website.
2. [Click this](https://github.com/xiashj2021/LZUThesis2025/releases/tag/v1.0.0) to download the .zip file, then upload it at [Overleaf](https://www.overleaf.com/).  
Click: `New Project -> Upload Project` (you can upload the .zip file you just downloaded).  
3. Modify the compilation method.  
In the upper left corner of the `Menu`, change `pdfLaTeX` to `XeLaTeX` in `Settings -> Compiler`!

## Main project documents
```
└─LZUTHESIS
    │  LZUThesis.cls     :: Undergraduate template profile
    │  template.tex      :: Thesis body
    │
    ├─bib
    │      lzubib.bst    :: Bibliography format file
    │      template.bib  :: Bibliography body
    │
    ├─figures            :: Folder for storing thesis figures, 'lzu2020.pdf' needs to be kept to display the cover school logo.
    │      lzu2007.png
    │      lzu2020.pdf
    │      lzu2020.png
    │      signature.pdf
    │
    └─fonts              :: Folder for storing thesis fonts
            Arialbd.ttf
            Msyhbd.ttc
            SimFang.ttf
            SimHei.ttf
            SimSun.ttc
```
`LZUThesis.cls` and `lzubib.bst` are originally modified from [suchot](https://github.com/suchot/LZUThesis2017) and [yuhldr](https://github.com/yuhldr/LZUThesis2020).
