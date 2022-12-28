
  Enclosed you should find the following three (3) files:


    PATCH.EXE    .RTPatch Professional patch file application program
    PATCH700.RTD Text file documenting what v7.00 files will be patched
    PATCH700.RTP Compressed PATCH data file for v7.00
    PATCH701.RTD Text file documenting what v7.01 files will be patched
    PATCH701.RTP Compressed PATCH data file for v7.01
    CRTASM.FIX   Forum message that enabled the creation of the patchs
    BP7PATCH.TXT Newsgroup message with additional patches
    README.TXT   The file you are reading


  This  patch is  for the  Borland Pascal  v7.00 and  v7.01 TPP.TPL  and
  TURBO.TPL files  to correct the  CRT Delay() division  by zero problem
  when executing on very fast CPU's.

  The  modifications to  the RTL  source were  made as  per instructions
  posted in the  CIS Delphi Forum by "Rob  Henningsgard 76470,3165". The
  complete forum message has been included in the file CRTASM.FIX.

  Please  be  sure  and  backup  of  your  TPP.TPL  and TURBO.TPL before
  attempting  to apply  this patch  as it  will modify  and replace your
  original  file. To  apply the  patch just  make sure  that all  of the
  PATCHxxx.* files enclosed  and a copy of the  original v7.00 files are
  in the  same directory and execute  PATCH PATCHxxx where "xxx"  is the
  version of BP7 that you are patching.

  Patch files will work with:

                TPP.TPL    59,680  10-27-92  7:00a
                TURBO.TPL  48,432  10-27-92  7:00a

                TPP.TPL    59,968  03-09-93  7:01a
                TURBO.TPL  48,464  03-09-93  7:01a



  Patch provided by
  Dennis Passmore
  CIS: 71640,2464
  Net: Dennis_Passmore@usgroup.com

  Special thanks to Rees Acheson [70674,2606] for the help in being able
  to provide the BP 7.01 patch files.

  08/18/97 - Updated the Patch files to include the PATCH.EXE option to
             IGNOREMISSING files so if a TPL is missing it will still
             patch the file(s) it finds.
