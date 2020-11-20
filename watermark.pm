sub WatermarkPDF {
my($file, $caption, $options) = @_;
my($file_targ) = dirname($file)."/test.".basename($file);

        return 0 if $file !~ /.+pdf$/;
        
        $caption = (length($caption) > 0)
                    ? $caption
                    : "TEST # TEST # TEST # TEST # TEST # TEST";

        require PDF::API2;

        my $pdf       = PDF::API2->open($file);
        my $pdf_targ  = PDF::API2->new(-file => $file_targ);

        my $pageno    = $pdf->pages();

        for(my $i = 1; $i <= $pageno; $i++){
                my($page)     = $pdf_targ->import_page($pdf, $i, $i);
                $page         = $pdf_targ->openpage($i);
                
                my($font)     = $pdf_targ->corefont('Arial');
                my($eg_trans) = $pdf_targ->egstate();
                $eg_trans->transparency(0.8);
                
                my($text)     = $page->text();
                $text->egstate($eg_trans);
                $text->font($font, 45);
                $text->transform(
                                  -translate => [0, 150],
                                  -rotate => 45,
                                );
                $text->text($caption);
                $pdf_targ->finishobjects($page, $text);
        }

        $pdf_targ->save();

        if($options->{Overwrite}){
                move($file_targ, $file);
        }
}
