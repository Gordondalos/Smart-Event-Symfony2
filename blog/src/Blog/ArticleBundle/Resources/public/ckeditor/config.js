/**
 * @license Copyright (c) 2003-2015, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
    config.enterMode = CKEDITOR.ENTER_BR;
    // Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
     config.filebrowserUploadUrl = 'blog/ArticleBundle/Resources/public/ckeditor/upload.php';

    config.filebrowserBrowseUrl = '/blog/web/bundles/blogarticle/kcfinder/browse.php?opener=ckeditor&type=files';
    config.filebrowserImageBrowseUrl = '/blog/web/bundles/blogarticle/kcfinder/browse.php?opener=ckeditor&type=images';
    config.filebrowserFlashBrowseUrl = '/blog/web/bundles/blogarticle/kcfinder/browse.php?opener=ckeditor&type=flash';
    config.filebrowserUploadUrl = '/blog/web/bundles/blogarticle/kcfinder/upload.php?opener=ckeditor&type=files';
    config.filebrowserImageUploadUrl = '/blog/web/bundles/blogarticle/kcfinder/upload.php?opener=ckeditor&type=images';
    config.filebrowserFlashUploadUrl = '/blog/web/bundles/blogarticle/kcfinder/upload.php?opener=ckeditor&type=flash';
};
