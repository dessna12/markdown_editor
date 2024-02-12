# 🔍📄 Flutter markdown_editor Application

 This is a Flutter application where you can
 - preview markdown files
 - make live changes on it.

Files are loaded from the OS and can be saved at the same location. 

> If the screenview is too narrow then the preview doesn't display. 

## Getting Started

Click on the button **Get File** to upload a file. Only the extensions <code>.md</code> are allowed.

An editor will then open, allowing you to make modifications on the file.
You can save your modifications pressing **Save** 💾 in the NavBar. Your changes will then be overwritten. 

>💡 If your screen width > 1000 px then you can have a live preview of the right hand side. 

## Structure of the project

This projet is developped in clean architecture. 

<details>
  <summary>Models</summary>

    1 model: file_model with variable path and content. One method copyWith to make changes to the content. 
</details>

<details>
  <summary>Data source</summary>

    1 abstract class FileLocalDataSource that retrieves the file and return a FileModel
</details>

<details>
  <summary>Service</summary>

    1 file Service that calls method load() from DataSource and save(). 
</details>

<details>
  <summary>Components and Pages</summary>

    2 pages: editor Page and Preview page. Components on body, file error.  
</details>

<details>
  <summary>Router</summary>

    a simple router with go_router  
</details>