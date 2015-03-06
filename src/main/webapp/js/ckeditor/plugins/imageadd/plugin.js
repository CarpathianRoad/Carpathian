CKEDITOR.plugins.add( 'imageadd', {
    icons: 'imageadd',
    init: function( editor ) {
        CKEDITOR.dialog.add( 'imageaddDialog', this.path + 'dialogs/abbr.js' );
    }
});
