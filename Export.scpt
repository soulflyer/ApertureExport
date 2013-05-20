FasdUAS 1.101.10   ��   ��    k             l      ��  ��   
This script makes some assumptions about the structure of the aperture Library
1) projects are contained within a month folder
2) month folders are contained within a year folder
3) All masters are referenced
4) masters are stored in a similar structure but the month directory is a 2 digit integer not a word
Behaviour could get a bit weird if this is not the case

Masters can be rsynced to the remote server using rsync -L
so that a real copy is made on the remote server but localy in the Published folder it is only a link
     � 	 	" 
 T h i s   s c r i p t   m a k e s   s o m e   a s s u m p t i o n s   a b o u t   t h e   s t r u c t u r e   o f   t h e   a p e r t u r e   L i b r a r y 
 1 )   p r o j e c t s   a r e   c o n t a i n e d   w i t h i n   a   m o n t h   f o l d e r 
 2 )   m o n t h   f o l d e r s   a r e   c o n t a i n e d   w i t h i n   a   y e a r   f o l d e r 
 3 )   A l l   m a s t e r s   a r e   r e f e r e n c e d 
 4 )   m a s t e r s   a r e   s t o r e d   i n   a   s i m i l a r   s t r u c t u r e   b u t   t h e   m o n t h   d i r e c t o r y   i s   a   2   d i g i t   i n t e g e r   n o t   a   w o r d 
 B e h a v i o u r   c o u l d   g e t   a   b i t   w e i r d   i f   t h i s   i s   n o t   t h e   c a s e 
 
 M a s t e r s   c a n   b e   r s y n c e d   t o   t h e   r e m o t e   s e r v e r   u s i n g   r s y n c   - L 
 s o   t h a t   a   r e a l   c o p y   i s   m a d e   o n   t h e   r e m o t e   s e r v e r   b u t   l o c a l y   i n   t h e   P u b l i s h e d   f o l d e r   i t   i s   o n l y   a   l i n k 
   
  
 l     ��������  ��  ��        l     ��  ��    Z TPlay with these to make the initial dialog box start with a different year and month     �   � P l a y   w i t h   t h e s e   t o   m a k e   t h e   i n i t i a l   d i a l o g   b o x   s t a r t   w i t h   a   d i f f e r e n t   y e a r   a n d   m o n t h      l     ����  r         c     	    n         1    ��
�� 
year  l     ����  I    ������
�� .misccurdldt    ��� null��  ��  ��  ��    m    ��
�� 
TEXT  o      ���� 0 curyear  ��  ��        l     ��  ��     set curyear to "2013"     �   * s e t   c u r y e a r   t o   " 2 0 1 3 "     !   l    "���� " r     # $ # c     % & % n     ' ( ' m    ��
�� 
mnth ( l    )���� ) I   ������
�� .misccurdldt    ��� null��  ��  ��  ��   & m    ��
�� 
TEXT $ o      ���� 0 curmonth  ��  ��   !  * + * l     �� , -��   ,   set curmonth to "February"    - � . . 4 s e t   c u r m o n t h   t o   " F e b r u a r y " +  / 0 / l     ��������  ��  ��   0  1 2 1 l   & 3���� 3 r    & 4 5 4 4    $�� 6
�� 
alis 6 l   # 7���� 7 b    # 8 9 8 l   ! :���� : I   !�� ; <
�� .earsffdralis        afdr ; m    ��
�� afdrscr� < �� =��
�� 
rtyp = m    ��
�� 
TEXT��  ��  ��   9 m   ! " > > � ? ? P A p p l i c a t i o n s : A p e r t u r e : E x p o r t L i b r a r y . s c p t��  ��   5 o      ���� 0 librarypath libraryPath��  ��   2  @ A @ l  ' . B���� B r   ' . C D C I  ' ,�� E��
�� .sysoloadscpt        file E o   ' (���� 0 librarypath libraryPath��   D o      ���� *0 loadedexportlibrary loadedExportLibrary��  ��   A  F G F j     �� H�� 	0 p_sql   H m      I I � J J " / u s r / b i n / s q l i t e 3   G  K L K p     M M ������ 0 dbpath DBPath��   L  N O N p     P P ������ 0 	g_libpath 	g_libPath��   O  Q R Q l     ��������  ��  ��   R  S T S l  / 6 U���� U r   / 6 V W V n   / 4 X Y X I   0 4�������� 0 
getlibpath 
getLibPath��  ��   Y o   / 0���� *0 loadedexportlibrary loadedExportLibrary W o      ���� 0 	g_libpath 	g_libPath��  ��   T  Z [ Z l  7 > \���� \ r   7 > ] ^ ] o   7 :��
�� 
ret  ^ o      ���� 0 theout theOut��  ��   [  _ ` _ l     ��������  ��  ��   `  a b a l  ? D c���� c r   ? D d e d m   ? @��
�� boovfals e o      ���� 0 	libcopied 	libCopied��  ��   b  f g f l  E N h���� h r   E N i j i n   E J k l k 1   F J��
�� 
psxp l o   E F���� 0 	g_libpath 	g_libPath j o      ���� 0 libposix libPOSIX��  ��   g  m n m l  O \ o���� o r   O \ p q p c   O X r s r l  O V t���� t b   O V u v u o   O R���� 0 libposix libPOSIX v m   R U w w � x x , / D a t a b a s e / L i b r a r y . a p d b��  ��   s m   V W��
�� 
TEXT q o      ���� 0 
libdbposix 
libDBPOSIX��  ��   n  y z y l     ��������  ��  ��   z  { | { l     ��������  ��  ��   |  } ~ } l  ] d ����  r   ] d � � � m   ] ` � � � � � < / U s e r s / i a i n / P i c t u r e s / P u b l i s h e d � o      ���� 0 publishedpath PublishedPath��  ��   ~  � � � l  e l ����� � r   e l � � � m   e h � � � � �  / t m p / P u b l i s h e d � o      ���� 0 	backupdir 	BackupDir��  ��   �  � � � l     ��������  ��  ��   �  � � � l  m | ����� � r   m | � � � c   m x � � � n   m v � � � 1   r v��
�� 
day  � l  m r ����� � I  m r������
�� .misccurdldt    ��� null��  ��  ��  ��   � m   v w��
�� 
TEXT � o      ���� 
0 curday  ��  ��   �  � � � l  } � ����� � r   } � � � � c   } � � � � n   } � � � � 1   � ���
�� 
time � l  } � ����� � I  } �������
�� .misccurdldt    ��� null��  ��  ��  ��   � m   � ���
�� 
TEXT � o      ���� 0 curtime  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � * $************************************    � � � � H * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * �  � � � l  � � ���� � Z   � � � ��~ � � n   � � � � � I   � ��} ��|�} 0 folderexists   �  � � � o   � ��{�{ 0 curyear   �  ��z � o   � ��y�y 0 curmonth  �z  �|   � o   � ��x�x *0 loadedexportlibrary loadedExportLibrary � r   � � � � � m   � ��w
�w boovtrue � o      �v�v 0 monthexists  �~   � r   � � � � � m   � ��u
�u boovfals � o      �t�t 0 monthexists  ��  �   �  � � � l     �s�r�q�s  �r  �q   �  � � � l  � � ��p�o � r   � � � � � m   � � � � � � � $ * *   C h a n g e   m o n t h   * * � o      �n�n 0 changemonthmessage  �p  �o   �  � � � l  � � ��m�l � r   � � � � � m   � � � � � � � " * *   C h a n g e   y e a r   * * � o      �k�k 0 changeyearmessage  �m  �l   �  � � � l  � � ��j�i � r   � � � � � m   � ��h
�h boovfals � o      �g�g 0 choosenproject  �j  �i   �  � � � l  � � ��f�e � r   � � � � � o   � ��d�d 0 changemonthmessage   � o      �c�c 0 pr  �f  �e   �  � � � l     �b�a�`�b  �a  �`   �  � � � l  �� ��_�^ � O   �� � � � V   �� � � � k   �� � �  � � � l  � ��] � ��]   � / )if curmonth is not changeyearmessage then    � � � � R i f   c u r m o n t h   i s   n o t   c h a n g e y e a r m e s s a g e   t h e n �  � � � Z   �( � ��\�[ � o   � ��Z�Z 0 monthexists   � O   �$ � � � O   �# � � � k   �" � �  � � � r   � � � � � m   � ��Y
�Y boovtrue � o      �X�X 0 choosenproject   �  � � � r   � � � � � e   � � � � n   � � � � � 1   � ��W
�W 
pnam � 2   � ��V
�V 
rkpj � o      �U�U 0 x   �  � � � r   � � � � o   ��T�T 0 changemonthmessage   � n       � � �  ;   � o  �S�S 0 x   �  � � � I �R � �
�R .gtqpchltns    @   @ ns   � o  �Q�Q 0 x   � �P ��O
�P 
prmp � m     �   C h o o s e   a   p r o j e c t�O   � �N r  " n   4  �M
�M 
cobj m  �L�L  1  �K
�K 
rslt o      �J�J 0 pr  �N   � 4   � ��I
�I 
rkfl o   � ��H�H 0 curmonth   � 4   � ��G	
�G 
rkfl	 o   � ��F�F 0 curyear  �\  �[   � 

 Z  )v�E�D = )0 o  ),�C�C 0 pr   o  ,/�B�B 0 changemonthmessage   k  3r  r  38 m  34�A
�A boovfals o      �@�@ 0 choosenproject   �? O  9r k  Bq  r  BO n  BK 1  GK�>
�> 
pnam 2  BG�=
�= 
rkfl o      �<�< 0 x     r  PX!"! o  PS�;�; 0 changeyearmessage  " n      #$#  ;  VW$ o  SV�:�: 0 x    %&% I Yf�9'(
�9 .gtqpchltns    @   @ ns  ' o  Y\�8�8 0 x  ( �7)�6
�7 
prmp) m  _b** �++  c h o o s e   m o n t h�6  & ,�5, r  gq-.- n  go/0/ 4  jo�41
�4 
cobj1 m  mn�3�3 0 1  gj�2
�2 
rslt. o      �1�1 0 curmonth  �5   4  9?�02
�0 
rkfl2 o  =>�/�/ 0 curyear  �?  �E  �D   3�.3 Z  w�45�-64 = w|787 o  wx�,�, 0 curmonth  8 o  x{�+�+ 0 changeyearmessage  5 k  �99 :;: r  �<=< 6�>?> n  �@A@ 1  ���*
�* 
pnamA 2  ��)
�) 
rkfl? F  ��BCB H  ��DD E  ��EFE 1  ���(
�( 
pnamF m  ��GG �HH  -C C  ��IJI 1  ���'
�' 
pnamJ m  ��KK �LL  2= o      �&�& 0 x  ; MNM l ���%OP�%  O J D Lazy programming. Must get round to fixing it before the year 3000.   P �QQ �   L a z y   p r o g r a m m i n g .   M u s t   g e t   r o u n d   t o   f i x i n g   i t   b e f o r e   t h e   y e a r   3 0 0 0 .N RSR I ���$TU
�$ .gtqpchltns    @   @ ns  T o  ���#�# 0 x  U �"V�!
�" 
prmpV m  ��WW �XX  c h o o s e   y e a r�!  S YZY r  ��[\[ n  ��]^] 4  ��� _
�  
cobj_ m  ���� ^ 1  ���
� 
rslt\ o      �� 0 curyear  Z `�` r  ��aba m  ���
� boovfalsb o      �� 0 monthexists  �  �-  6 r  ��cdc m  ���
� boovtrued o      �� 0 monthexists  �.   � H   � �ee o   � ��� 0 choosenproject   � m   � �ff�                                                                                  fstp  alis    P  
Subversion                 �1ubH+     OAperture.app                                                    
�p��        ����  	                Applications    �1�      �~�Z       O  %Subversion:Applications: Aperture.app     A p e r t u r e . a p p   
 S u b v e r s i o n  Applications/Aperture.app   / ��  �_  �^   � ghg l     ����  �  �  h iji l     ����  �  �  j klk l     �mn�  m  ** Choose a project **   n �oo , * *   C h o o s e   a   p r o j e c t   * *l pqp l     �rs�  r B <set pr to chooseProject(current date) of loadedExportLibrary   s �tt x s e t   p r   t o   c h o o s e P r o j e c t ( c u r r e n t   d a t e )   o f   l o a d e d E x p o r t L i b r a r yq uvu l     ����  �  �  v wxw l ��y��
y r  ��z{z c  ��|}| n  ��~~ I  ���	���	 0 monthtointeger  � ��� o  ���� 0 curmonth  �  �   o  ���� *0 loadedexportlibrary loadedExportLibrary} m  ���
� 
TEXT{ o      �� 0 monthint  �  �
  x ��� l � ���� Z  � ��� ��� = ����� n  ����� 1  ����
�� 
leng� o  ������ 0 monthint  � m  ������ � r  ����� b  ����� m  ���� ���  0� o  ������ 0 monthint  � o      ���� 0 monthint  �   ��  �  �  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l ������ r  ��� b  ��� b  ��� b  ��� b  ��� b  
��� b  ��� o  ���� 0 publishedpath PublishedPath� m  �� ���  /� o  	���� 0 curyear  � m  
�� ���  /� o  ���� 0 monthint  � m  �� ���  /� o  ���� 0 pr  � o      ���� 0 directorypath directoryPath��  ��  � ��� l 6������ r  6��� b  2��� b  .��� b  *��� b  (��� b  &��� o  "���� 0 	backupdir 	BackupDir� m  "%�� ���  /� o  &'���� 0 curyear  � o  ()���� 0 curmonth  � o  *-���� 
0 curday  � o  .1���� 0 curtime  � o      ���� 0 prbackupdir PrBackupDir��  ��  � ��� l 7B������ r  7B��� b  7>��� o  7:���� 0 directorypath directoryPath� m  :=�� ���  / m a s t e r s� o      ���� 0 masterspath mastersPath��  ��  � ��� l CN������ r  CN��� b  CJ��� o  CF���� 0 directorypath directoryPath� m  FI�� ���  / t h u m b s� o      ���� 0 
thumbspath 
thumbsPath��  ��  � ��� l OZ������ r  OZ��� b  OV��� o  OR���� 0 directorypath directoryPath� m  RU�� ���  / w a t e r m a r k e d� o      ���� "0 watermarkedpath watermarkedPath��  ��  � ��� l     ��������  ��  ��  � ��� l [������� O  [���� O  a���� k  l��� ��� l ll������  �   get the project notes   � ��� ,   g e t   t h e   p r o j e c t   n o t e s� ��� r  l���� b  l���� b  l���� b  l}��� b  ly��� o  lq���� 	0 p_sql  � l qx������ n  qx��� 1  tx��
�� 
strq� o  qt���� 0 
libdbposix 
libDBPOSIX��  ��  � m  y|�� ��� `   " s e l e c t   n o t e   f r o m   R K N O T E   w h e r e   A T T A C H E D T O U U I D = '� 1  }���
�� 
ID  � m  ���� ���  ' "� o      ���� 0 	thescript  � ��� r  ����� I �������
�� .sysoexecTEXT���     TEXT� o  ������ 0 	thescript  ��  � o      ���� 	0 notes  � � � l ����������  ��  ��     r  �� c  �� l ������ 6��	 2  ����
�� 
rkdp	 G  ��

 l ������ ? �� 1  ����
�� 
rkmr m  ������ ��  ��   l ������ = �� 1  ����
�� 
rkvc m  ����
�� rkclrkRD��  ��  ��  ��   m  ����
�� 
list o      ���� 
0 cursel    r  �� c  �� l ������ 6 �� 2  ����
�� 
rkdp E  �� n  �� 1  ����
�� 
pnam 2  ����
�� 
rkkw m  �� �    B o r d e r F X��  ��   m  ����
�� 
list o      ���� 0 watermarkedsel   !"! l ����������  ��  ��  " #��# n  ��$%$ I  ����&���� 0 
seturgency 
setUrgency& '��' o  ������ 0 pr  ��  ��  % o  ������ *0 loadedexportlibrary loadedExportLibrary��  � 4  ai��(
�� 
rkpj( o  eh���� 0 pr  � m  [^))�                                                                                  fstp  alis    P  
Subversion                 �1ubH+     OAperture.app                                                    
�p��        ����  	                Applications    �1�      �~�Z       O  %Subversion:Applications: Aperture.app     A p e r t u r e . a p p   
 S u b v e r s i o n  Applications/Aperture.app   / ��  ��  ��  � *+* l     ��������  ��  ��  + ,-, l     ��������  ��  ��  - ./. l     ��������  ��  ��  / 010 l     ��23��  2 ) #**** Backup any existing files ****   3 �44 F * * * *   B a c k u p   a n y   e x i s t i n g   f i l e s   * * * *1 565 l     ��78��  7    check if backupdir exists   8 �99 4   c h e c k   i f   b a c k u p d i r   e x i s t s6 :;: l �<����< Z  �=>����= H  ��?? n  ��@A@ I  ����B���� 0 
fileexists 
fileExistsB C��C n  ��DED 1  ����
�� 
psxpE o  ������ 0 	backupdir 	BackupDir��  ��  A o  ������ *0 loadedexportlibrary loadedExportLibrary> k  �FF GHG r  �IJI b  �KLK m  � MM �NN  m k d i r   - p  L l  O����O n   PQP 1  ��
�� 
psxpQ o   ���� 0 	backupdir 	BackupDir��  ��  J o      ���� 0 	thescript  H R��R I ��S��
�� .sysoexecTEXT���     TEXTS o  ���� 0 	thescript  ��  ��  ��  ��  ��  ��  ; TUT l     ��������  ��  ��  U VWV l KX����X Z  KYZ����Y n  %[\[ I  %��]��� 0 
fileexists 
fileExists] ^�~^ n  !_`_ 1  !�}
�} 
psxp` o  �|�| 0 directorypath directoryPath�~  �  \ o  �{�{ *0 loadedexportlibrary loadedExportLibraryZ k  (Gaa bcb r  (?ded b  (;fgf b  (3hih b  (/jkj m  (+ll �mm  m v  k o  +.�z�z 0 directorypath directoryPathi m  /2nn �oo   g l 3:p�y�xp n  3:qrq 1  6:�w
�w 
psxpr o  36�v�v 0 prbackupdir PrBackupDir�y  �x  e o      �u�u 0 	thescript  c s�ts I @G�st�r
�s .sysoexecTEXT���     TEXTt o  @C�q�q 0 	thescript  �r  �t  ��  ��  ��  ��  W uvu l     �p�o�n�p  �o  �n  v wxw l Lgy�m�ly r  Lgz{z b  Lc|}| b  L_~~ b  L[��� b  LW��� b  LS��� m  LO�� ���  m k d i r   - p  � o  OR�k�k 0 
thumbspath 
thumbsPath� m  SV�� ���  ;   m k d i r   - p  � o  WZ�j�j "0 watermarkedpath watermarkedPath m  [^�� ���  / t m p   ;   m k d i r  } o  _b�i�i 0 masterspath mastersPath{ o      �h�h 0 	thescript  �m  �l  x ��� l     �g���g  � M Gmaking thumbspath with the -p option causes directorypath to be created   � ��� � m a k i n g   t h u m b s p a t h   w i t h   t h e   - p   o p t i o n   c a u s e s   d i r e c t o r y p a t h   t o   b e   c r e a t e d� ��� l ho��f�e� I ho�d��c
�d .sysoexecTEXT���     TEXT� o  hk�b�b 0 	thescript  �c  �f  �e  � ��� l     �a�`�_�a  �`  �_  � ��� l     �^���^  �   **** export the notes ****   � ��� 4 * * * *   e x p o r t   t h e   n o t e s   * * * *� ��� l p���]�\� r  p���� b  p���� b  p��� b  p{��� b  pw��� m  ps�� ���  e c h o   "� o  sv�[�[ 	0 notes  � m  wz�� ���  " >  � o  {~�Z�Z 0 directorypath directoryPath� m  ��� ���  / n o t e s . t x t� o      �Y�Y 0 	thescript  �]  �\  � ��� l ����X�W� I ���V��U
�V .sysoexecTEXT���     TEXT� o  ���T�T 0 	thescript  �U  �X  �W  � ��� l     �S�R�Q�S  �R  �Q  � ��� l     �P���P  �  **** Export the pics ****   � ��� 2 * * * *   E x p o r t   t h e   p i c s   * * * *� ��� l ����O�N� n  ����� I  ���M��L�M 0 
exportpics 
exportPics� ��� o  ���K�K 
0 cursel  � ��� o  ���J�J 0 
libdbposix 
libDBPOSIX� ��� o  ���I�I 0 directorypath directoryPath� ��� o  ���H�H 0 
thumbspath 
thumbsPath� ��G� o  ���F�F "0 watermarkedpath watermarkedPath�G  �L  � o  ���E�E *0 loadedexportlibrary loadedExportLibrary�O  �N  � ��� l     �D�C�B�D  �C  �B  � ��� l     �A���A  � \ V**** Export the hand watermarked pics to replace the automatically generated ones ****   � ��� � * * * *   E x p o r t   t h e   h a n d   w a t e r m a r k e d   p i c s   t o   r e p l a c e   t h e   a u t o m a t i c a l l y   g e n e r a t e d   o n e s   * * * *� ��� l ����@�?� n  ����� I  ���>��=�> 60 exporthandwatermarkedpics exportHandWatermarkedPics� ��� o  ���<�< 0 watermarkedsel  � ��� o  ���;�; 0 
libdbposix 
libDBPOSIX� ��:� o  ���9�9 "0 watermarkedpath watermarkedPath�:  �=  � o  ���8�8 *0 loadedexportlibrary loadedExportLibrary�@  �?  � ��� l     �7�6�5�7  �6  �5  � ��� l     �4���4  � $ **** Add links to masters ****   � ��� < * * * *   A d d   l i n k s   t o   m a s t e r s   * * * *� ��� l ����3�2� n  ����� I  ���1��0�1 0 addlinks addLinks� ��� o  ���/�/ 
0 cursel  � ��� o  ���.�. 0 masterspath mastersPath� ��-� o  ���,�, 0 
libdbposix 
libDBPOSIX�-  �0  � o  ���+�+ *0 loadedexportlibrary loadedExportLibrary�3  �2  � ��� l     �*�)�(�*  �)  �(  � ��'� l     �&�%�$�&  �%  �$  �'       "�#� I��������"�� � ����! � �� ���� ��#  �  ���������������������
�	��������� ��� 	0 p_sql  
� .aevtoappnull  �   � ****� 0 curyear  � 0 curmonth  � 0 librarypath libraryPath� *0 loadedexportlibrary loadedExportLibrary� 0 	g_libpath 	g_libPath� 0 theout theOut� 0 	libcopied 	libCopied� 0 libposix libPOSIX� 0 
libdbposix 
libDBPOSIX� 0 publishedpath PublishedPath� 0 	backupdir 	BackupDir� 
0 curday  � 0 curtime  � 0 monthexists  � 0 changemonthmessage  � 0 changeyearmessage  � 0 choosenproject  � 0 pr  �
 0 x  �	 0 monthint  � 0 directorypath directoryPath� 0 prbackupdir PrBackupDir� 0 masterspath mastersPath� 0 
thumbspath 
thumbsPath� "0 watermarkedpath watermarkedPath� 0 	thescript  � 	0 notes  � 
0 cursel  �  0 watermarkedsel  ��  � ������	
��
�� .aevtoappnull  �   � **** k    �       1  @  S  Z  a  f  m  }  �  �  �  �  �  �  �  �  � w �   �!! �"" �## �$$ �%% �&& :'' V(( w)) �** �++ �,, �-- �.. �����  ��  ��  	  
 e�������������������� >�������������������� w�� ��� ��������������� ��� �������f���������� ������*/GKW��������������������������������������������������������Mln��������������
�� .misccurdldt    ��� null
�� 
year
�� 
TEXT�� 0 curyear  
�� 
mnth�� 0 curmonth  
�� 
alis
�� afdrscr�
�� 
rtyp
�� .earsffdralis        afdr�� 0 librarypath libraryPath
�� .sysoloadscpt        file�� *0 loadedexportlibrary loadedExportLibrary�� 0 
getlibpath 
getLibPath�� 0 	g_libpath 	g_libPath
�� 
ret �� 0 theout theOut�� 0 	libcopied 	libCopied
�� 
psxp�� 0 libposix libPOSIX�� 0 
libdbposix 
libDBPOSIX�� 0 publishedpath PublishedPath�� 0 	backupdir 	BackupDir
�� 
day �� 
0 curday  
�� 
time�� 0 curtime  �� 0 folderexists  �� 0 monthexists  �� 0 changemonthmessage  �� 0 changeyearmessage  �� 0 choosenproject  �� 0 pr  
�� 
rkfl
�� 
rkpj
�� 
pnam�� 0 x  
�� 
prmp
�� .gtqpchltns    @   @ ns  
�� 
rslt
�� 
cobj/  �� 0 monthtointeger  �� 0 monthint  
�� 
leng�� 0 directorypath directoryPath�� 0 prbackupdir PrBackupDir�� 0 masterspath mastersPath�� 0 
thumbspath 
thumbsPath�� "0 watermarkedpath watermarkedPath
�� 
strq
�� 
ID  �� 0 	thescript  
�� .sysoexecTEXT���     TEXT�� 	0 notes  
�� 
rkdp
�� 
rkmr
�� 
rkvc
�� rkclrkRD
�� 
list�� 
0 cursel  
�� 
rkkw�� 0 watermarkedsel  �� 0 
seturgency 
setUrgency�� 0 
fileexists 
fileExists�� �� 0 
exportpics 
exportPics�� 60 exporthandwatermarkedpics exportHandWatermarkedPics�� 0 addlinks addLinks���*j  �,�&E�O*j  �,�&E�O*����l 	�%/E�O�j E�O�j+ E�O_ E` OfE` O�a ,E` O_ a %�&E` Oa E` Oa E` O*j  a ,�&E` O*j  a ,�&E` O���l+  
eE`  Y fE`  Oa !E` "Oa #E` $OfE` %O_ "E` &Oa 'h_ %_   Q*a (�/ D*a (�/ :eE` %O*a )-a *,EE` +O_ "_ +6FO_ +a ,a -l .O_ /a 0k/E` &UUY hO_ &_ "  DfE` %O*a (�/ 1*a (-a *,E` +O_ $_ +6FO_ +a ,a 1l .O_ /a 0k/E�UY hO�_ $  O*a (-a *,a 2[[a *,\Za 3@C\[a *,\Za 4>A1E` +O_ +a ,a 5l .O_ /a 0k/E�OfE`  Y eE`  [OY��UO��k+ 6�&E` 7O_ 7a 8,k  a 9_ 7%E` 7Y hO_ a :%�%a ;%_ 7%a <%_ &%E` =O_ a >%�%�%_ %_ %E` ?O_ =a @%E` AO_ =a B%E` CO_ =a D%E` EOa ' �*a )_ &/ �b   _ a F,%a G%*a H,%a I%E` JO_ Jj KE` LO*a M-a 2[[a N,\Zm:\[a O,\Za P8B1a Q&E` RO*a M-a 2[a S-a *,\Za T@1a Q&E` UO�_ &k+ VUUO�_ a ,k+ W a X_ a ,%E` JO_ Jj KY hO�_ =a ,k+ W $a Y_ =%a Z%_ ?a ,%E` JO_ Jj KY hOa [_ C%a \%_ E%a ]%_ A%E` JO_ Jj KOa ^_ L%a _%_ =%a `%E` JO_ Jj KO�_ R_ _ =_ C_ Ea a+ bO�_ U_ _ Em+ cO�_ R_ A_ m+ d� �00  2 0 1 3� �11 
 A p r i l��alis    �   
Subversion                 �1ubH+   sɷExportLibrary.scpt                                              ��ͳ�QosasToyS����  	                ApertureExport    �1�      ͳ��     sɷ c �| �  @Subversion:Users: iain: Code: ApertureExport: ExportLibrary.scpt  &  E x p o r t L i b r a r y . s c p t   
 S u b v e r s i o n  1Users/iain/Code/ApertureExport/ExportLibrary.scpt   /    ��  � ��2 3��  2 k      44 565 j     ��7�� 	0 p_sql  7 m     88 �99 " / u s r / b i n / s q l i t e 3  6 :;: l     ��������  ��  ��  ; <=< i    >?> I      ��@���� 0 
fileexists 
fileExists@ A��A o      ���� 0 	posixpath 	posixPath��  ��  ? L     BB c     CDC l    E����E c     FGF l    H����H I    ��I��
�� .sysoexecTEXT���     TEXTI b     JKJ b     LML m     NN �OO  i f   t e s t   - e  M n    PQP 1    ��
�� 
strqQ o    ���� 0 	posixpath 	posixPathK m    RR �SS < ;   t h e n 
 e c h o   1 ; 
 e l s e 
 e c h o   0 ; 
 f i��  ��  ��  G m    ��
�� 
long��  ��  D m    ��
�� 
bool= TUT l     ��������  ��  ��  U VWV i    
XYX I      ��Z���� 0 folderexists  Z [\[ o      ���� 0 
folderyear  \ ]��] o      ���� 0 foldermonth  ��  ��  Y O     1^_^ k    0`` aba Z    -cd����c I   ��e��
�� .coredoexnull���     ****e 4    ��f
�� 
rkflf o    ���� 0 
folderyear  ��  d O    )ghg Z    (ij��ki I   ��l��
�� .coredoexnull���     ****l 4    ��m
�� 
rkflm o    ���� 0 foldermonth  ��  j L   ! #nn m   ! "��
�� boovtrue��  k L   & (oo m   & '��
�� boovfalsh 4    ��p
�� 
rkflp o    ���� 0 
folderyear  ��  ��  b q��q L   . 0rr m   . /��
�� boovfals��  _ m     ss�                                                                                  fstp  alis    P  
Subversion                 �1ubH+     OAperture.app                                                    
�p��        ����  	                Applications    �1�      �~�Z       O  %Subversion:Applications: Aperture.app     A p e r t u r e . a p p   
 S u b v e r s i o n  Applications/Aperture.app   / ��  W tut l     ��������  ��  ��  u vwv l     ��������  ��  ��  w xyx l     ��������  ��  ��  y z{z i    |}| I      ��~��� 0 monthtointeger  ~ �~ o      �}�} 0 monthstring  �~  �  } L     �� c     ��� n     
��� m    
�|
�| 
mnth� 4     �{�
�{ 
ldt � l   ��z�y� b    ��� b    ��� m    �� ���  1 /� o    �x�x 0 monthstring  � m    �� ��� 
 / 2 0 1 2�z  �y  � m   
 �w
�w 
long{ ��� l     �v�u�t�v  �u  �t  � ��� i    ��� I      �s��r�s 0 monthtostring  � ��q� o      �p�p 0 monthint  �q  �r  � L     �� c     ��� n     
��� m    
�o
�o 
mnth� 4     �n�
�n 
ldt � l   ��m�l� b    ��� b    ��� m    �� ���  1 /� o    �k�k 0 monthint  � m    �� ��� 
 / 2 0 1 2�m  �l  � m   
 �j
�j 
TEXT� ��� l     �i�h�g�i  �h  �g  � ��� i    ��� I      �f��e�f 0 chooseproject chooseProject� ��d� o      �c�c 0 adate aDate�d  �e  � k    �� ��� r     ��� c     ��� n     ��� 1    �b
�b 
year� o     �a�a 0 adate aDate� m    �`
�` 
TEXT� o      �_�_ 0 curyear  � ��� r    ��� c    ��� n    ��� m   	 �^
�^ 
mnth� o    	�]�] 0 adate aDate� m    �\
�\ 
TEXT� o      �[�[ 0 curmonth  � ��� r    ��� c    ��� n    ��� 1    �Z
�Z 
day � o    �Y�Y 0 adate aDate� m    �X
�X 
TEXT� o      �W�W 
0 curday  � ��� r    ��� c    ��� n    ��� 1    �V
�V 
time� o    �U�U 0 adate aDate� m    �T
�T 
TEXT� o      �S�S 0 curtime  � ��� l     �R�Q�P�R  �Q  �P  � ��� Z     3���O�� I     '�N��M�N 0 folderexists  � ��� o   ! "�L�L 0 curyear  � ��K� o   " #�J�J 0 curmonth  �K  �M  � r   * -��� m   * +�I
�I boovtrue� o      �H�H 0 monthexists  �O  � r   0 3��� m   0 1�G
�G boovfals� o      �F�F 0 monthexists  � ��� l  4 4�E�D�C�E  �D  �C  � ��� r   4 7��� m   4 5�� ��� $ * *   C h a n g e   m o n t h   * *� o      �B�B 0 changemonthmessage  � ��� r   8 ;��� m   8 9�� ��� " * *   C h a n g e   y e a r   * *� o      �A�A 0 changeyearmessage  � ��� r   < ?��� m   < =�@
�@ boovfals� o      �?�? 0 choosenproject  � ��� r   @ C��� o   @ A�>�> 0 changemonthmessage  � o      �=�= 0 pr  � ��� l  D D�<�;�:�<  �;  �:  � ��9� O   D��� k   H�� ��� V   H	��� k   O�� � � l  O O�8�8   / )if curmonth is not changeyearmessage then    � R i f   c u r m o n t h   i s   n o t   c h a n g e y e a r m e s s a g e   t h e n   Z   O ��7�6 o   O P�5�5 0 monthexists   O   S �	 O   Z �

 k   a �  r   a d m   a b�4
�4 boovtrue o      �3�3 0 choosenproject    r   e m e   e k n   e k 1   h j�2
�2 
pnam 2   e h�1
�1 
rkpj o      �0�0 0 x    r   n r o   n o�/�/ 0 changemonthmessage   n        ;   p q o   o p�.�. 0 x    I  s z�- !
�- .gtqpchltns    @   @ ns    o   s t�,�, 0 x  ! �+"�*
�+ 
prmp" m   u v## �$$   C h o o s e   a   p r o j e c t�*   %�)% r   { �&'& n   { �()( 4   | ��(*
�( 
cobj* m    ��'�' ) 1   { |�&
�& 
rslt' o      �%�% 0 pr  �)   4   Z ^�$+
�$ 
rkfl+ o   \ ]�#�# 0 curmonth  	 4   S W�",
�" 
rkfl, o   U V�!�! 0 curyear  �7  �6   -.- Z   � �/0� �/ =  � �121 o   � ��� 0 pr  2 o   � ��� 0 changemonthmessage  0 k   � �33 454 r   � �676 m   � ��
� boovfals7 o      �� 0 choosenproject  5 8�8 O   � �9:9 k   � �;; <=< r   � �>?> n   � �@A@ 1   � ��
� 
pnamA 2   � ��
� 
rkfl? o      �� 0 x  = BCB r   � �DED o   � ��� 0 changeyearmessage  E n      FGF  ;   � �G o   � ��� 0 x  C HIH I  � ��JK
� .gtqpchltns    @   @ ns  J o   � ��� 0 x  K �L�
� 
prmpL m   � �MM �NN  c h o o s e   m o n t h�  I O�O r   � �PQP n   � �RSR 4   � ��T
� 
cobjT m   � ��� S 1   � ��
� 
rsltQ o      �� 0 curmonth  �  : 4   � ��U
� 
rkflU o   � ��
�
 0 curyear  �  �   �  . V�	V Z   �WX�YW =  � �Z[Z o   � ��� 0 curmonth  [ o   � ��� 0 changeyearmessage  X k   � �\\ ]^] r   � �_`_ 6 � �aba n   � �cdc 1   � ��
� 
pnamd 2   � ��
� 
rkflb F   � �efe H   � �gg E   � �hih 1   � ��
� 
pnami m   � �jj �kk  -f C   � �lml 1   � ��
� 
pnamm m   � �nn �oo  2` o      �� 0 x  ^ pqp l  � �� rs�   r J D Lazy programming. Must get round to fixing it before the year 3000.   s �tt �   L a z y   p r o g r a m m i n g .   M u s t   g e t   r o u n d   t o   f i x i n g   i t   b e f o r e   t h e   y e a r   3 0 0 0 .q uvu I  � ���wx
�� .gtqpchltns    @   @ ns  w o   � ����� 0 x  x ��y��
�� 
prmpy m   � �zz �{{  c h o o s e   y e a r��  v |}| r   � �~~ n   � ���� 4   � ����
�� 
cobj� m   � ����� � 1   � ���
�� 
rslt o      ���� 0 curyear  } ���� r   � ���� m   � ���
�� boovfals� o      ���� 0 monthexists  ��  �  Y r  ��� m  ��
�� boovtrue� o      ���� 0 monthexists  �	  � H   L N�� o   L M���� 0 choosenproject  � ���� L  
�� o  
���� 0 pr  ��  � m   D E���                                                                                  fstp  alis    P  
Subversion                 �1ubH+     OAperture.app                                                    
�p��        ����  	                Applications    �1�      �~�Z       O  %Subversion:Applications: Aperture.app     A p e r t u r e . a p p   
 S u b v e r s i o n  Applications/Aperture.app   / ��  �9  � ��� l     ��������  ��  ��  � ��� i    ��� I      ������� 0 
seturgency 
setUrgency� ���� o      ���� 0 pr  ��  ��  � O     ���� O    ���� k    ��� ��� l   ������  � W Q Digikam uses Urgency to store the ratings, so convert Aperture rating to urgency   � ��� �   D i g i k a m   u s e s   U r g e n c y   t o   s t o r e   t h e   r a t i n g s ,   s o   c o n v e r t   A p e r t u r e   r a t i n g   t o   u r g e n c y� ��� O    )��� I   (�����
�� .corecrel****      � null��  � ����
�� 
kocl� m    ��
�� 
rkip� �����
�� 
prdt� K    $�� ����
�� 
pnam� m     �� ���  U r g e n c y� �����
�� 
rkvl� m   ! "�� ���  1��  ��  � l   ������ 6  ��� 2    ��
�� 
rkdp� =   ��� 1    ��
�� 
rkmr� m    ���� ��  ��  � ��� O   * J��� I  9 I�����
�� .corecrel****      � null��  � ����
�� 
kocl� m   ; <��
�� 
rkip� �����
�� 
prdt� K   = E�� ����
�� 
pnam� m   > ?�� ���  U r g e n c y� �����
�� 
rkvl� m   @ C�� ���  2��  ��  � l  * 6������ 6 * 6��� 2   * -��
�� 
rkdp� =  . 5��� 1   / 1��
�� 
rkmr� m   2 4���� ��  ��  � ��� O   K m��� I  Z l�����
�� .corecrel****      � null��  � ����
�� 
kocl� m   \ ]��
�� 
rkip� �����
�� 
prdt� K   ^ h�� ����
�� 
pnam� m   _ b�� ���  U r g e n c y� �����
�� 
rkvl� m   c f�� ���  4��  ��  � l  K W������ 6 K W��� 2   K N��
�� 
rkdp� =  O V��� 1   P R��
�� 
rkmr� m   S U���� ��  ��  � ��� O   n ���� I  } ������
�� .corecrel****      � null��  � ����
�� 
kocl� m    ���
�� 
rkip� �����
�� 
prdt� K   � ��� ����
�� 
pnam� m   � ��� ���  U r g e n c y� �����
�� 
rkvl� m   � ��� ���  5��  ��  � l  n z������ 6 n z��� 2   n q��
�� 
rkdp� =  r y��� 1   s u��
�� 
rkmr� m   v x���� ��  ��  � ���� O   � ���� I  � ������
�� .corecrel****      � null��  � ����
�� 
kocl� m   � ���
�� 
rkip� �����
�� 
prdt� K   � ��� ����
�� 
pnam� m   � ��� ���  U r g e n c y� �����
�� 
rkvl� m   � ��� �    6��  ��  � l  � ����� 6 � � 2   � ���
�� 
rkdp =  � � 1   � ���
�� 
rkmr m   � ����� ��  ��  ��  � 4    ��
�� 
rkpj o    ���� 0 pr  � m     �                                                                                  fstp  alis    P  
Subversion                 �1ubH+     OAperture.app                                                    
�p��        ����  	                Applications    �1�      �~�Z       O  %Subversion:Applications: Aperture.app     A p e r t u r e . a p p   
 S u b v e r s i o n  Applications/Aperture.app   / ��  � 	 l     ��������  ��  ��  	 

 i     I      ������ 0 addlinks addLinks  1      ��
�� 
sele  o      ���� 0 	linkspath 	linksPath �� o      ���� 0 databasepath databasePath��  ��   k      Z     ���� H      n     I    ������ 0 
fileexists 
fileExists �� o    ���� 0 	linkspath 	linksPath��  ��    f      k   
    r   
 !"! b   
 #$# m   
 %% �&&  m k d i r  $ o    ���� 0 	linkspath 	linksPath" o      ���� 0 	thescript    '��' I   ��(��
�� .sysoexecTEXT���     TEXT( o    ���� 0 	thescript  ��  ��  ��  ��   )*) r    +,+ o    ��
�� 
ret , o      ���� 0 theout theOut* -.- O   /0/ X   "1��21 k   233 454 r   2 7676 n   2 5898 1   3 5��
�� 
rkrd9 o   2 3���� 
0 curimg  7 o      ���� 0 isref isRef5 :;: r   8 =<=< n   8 ;>?> 1   9 ;��
�� 
ID  ? o   8 9���� 
0 curimg  = o      ���� 0 curid curID; @A@ l  > >����~��  �  �~  A BCB r   > CDED n   > AFGF 1   ? A�}
�} 
pnamG o   > ?�|�| 
0 curimg  E o      �{�{ 0 curname  C HIH r   D LJKJ n   D JLML 1   H J�z
�z 
rkvlM n   D HNON 4   E H�yP
�y 
rkotP m   F GQQ �RR  F i l e N a m eO o   D E�x�x 
0 curimg  K o      �w�w 0 
mastername 
masterNameI STS l  M M�v�u�t�v  �u  �t  T UVU r   M RWXW l  M PY�s�rY b   M PZ[Z l  M N\�q�p\ o   M N�o�o 0 curname  �q  �p  [ m   N O]] �^^            -          �s  �r  X o      �n�n 0 newline newLineV _`_ l  S S�m�l�k�m  �l  �k  ` aba Z   Scd�j�ic =  S Vefe o   S T�h�h 0 isref isReff m   T U�g
�g boovtrued k   Ygg hih r   Y njkj b   Y llml b   Y hnon b   Y fpqp b   Y brsr o   Y ^�f�f 	0 p_sql  s l  ^ at�e�dt n   ^ auvu 1   _ a�c
�c 
strqv o   ^ _�b�b 0 databasepath databasePath�e  �d  q m   b eww �xx ^   " s e l e c t   M A S T E R U U I D   f r o m   R K V E R S I O N   w h e r e   U U I D = 'o o   f g�a�a 0 curid curIDm m   h kyy �zz  ' "k o      �`�` 0 	thescript  i {|{ r   o v}~} I  o t�_�^
�_ .sysoexecTEXT���     TEXT o   o p�]�] 0 	thescript  �^  ~ o      �\�\ 0 	zfileuuid 	ZFILEUUID| ��� l  w w�[�Z�Y�[  �Z  �Y  � ��� l  w w�X���X  � ' ! ---------- Get the master's path   � ��� B   - - - - - - - - - -   G e t   t h e   m a s t e r ' s   p a t h� ��� r   w ���� b   w ���� b   w ���� b   w ���� b   w ���� o   w |�W�W 	0 p_sql  � l  | ��V�U� n   | ��� 1   } �T
�T 
strq� o   | }�S�S 0 databasepath databasePath�V  �U  � m   � ��� ��� Z   " s e l e c t   I M A G E P A T H   f r o m   R K M A S T E R   w h e r e   U U I D = '� o   � ��R�R 0 	zfileuuid 	ZFILEUUID� m   � ��� ���  ' "� o      �Q�Q 0 	thescript  � ��� r   � ���� I  � ��P��O
�P .sysoexecTEXT���     TEXT� o   � ��N�N 0 	thescript  �O  � o      �M�M 0 
zimagepath 
ZIMAGEPATH� ��� l  � ��L�K�J�L  �K  �J  � ��� l  � ��I���I  � , & ---------- Get the master's disk name   � ��� L   - - - - - - - - - -   G e t   t h e   m a s t e r ' s   d i s k   n a m e� ��� r   � ���� b   � ���� b   � ���� b   � ���� b   � ���� o   � ��H�H 	0 p_sql  � l  � ���G�F� n   � ���� 1   � ��E
�E 
strq� o   � ��D�D 0 databasepath databasePath�G  �F  � m   � ��� ��� d   " s e l e c t   F I L E V O L U M E U U I D   f r o m   R K M A S T E R   w h e r e   U U I D = '� o   � ��C�C 0 	zfileuuid 	ZFILEUUID� m   � ��� ���  ' "� o      �B�B 0 	thescript  � ��� r   � ���� I  � ��A��@
�A .sysoexecTEXT���     TEXT� o   � ��?�? 0 	thescript  �@  � o      �>�> "0 zfilevolumeuuid ZFILEVOLUMEUUID� ��� r   � ���� b   � ���� b   � ���� b   � ���� b   � ���� o   � ��=�= 	0 p_sql  � l  � ���<�;� n   � ���� 1   � ��:
�: 
strq� o   � ��9�9 0 databasepath databasePath�<  �;  � m   � ��� ��� P   " s e l e c t   N A M E   f r o m   R K V O L U M E   w h e r e   U U I D = '� o   � ��8�8 "0 zfilevolumeuuid ZFILEVOLUMEUUID� m   � ��� ���  ' "� o      �7�7 0 	thescript  � ��� r   � ���� I  � ��6��5
�6 .sysoexecTEXT���     TEXT� o   � ��4�4 0 	thescript  �5  � o      �3�3 0 diskname diskName� ��� l  � ��2�1�0�2  �1  �0  � ��� r   � ���� b   � ���� m   � ��� ���  /� o   � ��/�/ 0 
zimagepath 
ZIMAGEPATH� o      �.�. 0 imgpath imgPath� ��� r   � ���� b   � ���� b   � ���� b   � ���� b   � ���� b   � ���� m   � ��� ���  l n   - s  � n   � ���� 1   � ��-
�- 
strq� o   � ��,�, 0 imgpath imgPath� m   � ��� ���   � o   � ��+�+ 0 	linkspath 	linksPath� m   � ��� ���  /� n   � ���� 1   � ��*
�* 
strq� o   � ��)�) 0 
mastername 
masterName� o      �(�( 0 	thescript  � ��'� Q   ����&� I  � ��%��$
�% .sysoexecTEXT���     TEXT� o   � ��#�# 0 	thescript  �$  � R      �"�!� 
�" .ascrerr ****      � ****�!  �   �&  �'  �j  �i  b ��� l ����  �  �  � ��� r     b  
 o  �� 0 newline newLine o  	�� 0 	thescript   o      �� 0 newline newLine�  r   b  	 b  

 o  �� 0 theout theOut o  �� 0 newline newLine	 o  �
� 
ret  o      �� 0 theout theOut � l ����  �  �  �  �� 
0 curimg  2 1   % &�
� 
sele0 m    �                                                                                  fstp  alis    P  
Subversion                 �1ubH+     OAperture.app                                                    
�p��        ����  	                Applications    �1�      �~�Z       O  %Subversion:Applications: Aperture.app     A p e r t u r e . a p p   
 S u b v e r s i o n  Applications/Aperture.app   / ��  . � L   o  �� 0 theout theOut�    l     ����  �  �    i    " I      ��
� 0 
exportpics 
exportPics  o      �	�	 0 selectedpics selectedPics  o      �� 0 databasepath databasePath  o      �� 0 dpath dPath  o      �� 0 tpath tPath � o      �� 0 wpath wPath�  �
   k    �   !"! r     #$# c     	%&% n     '(' 1    �
� 
year( l    )��) I    � ����
�  .misccurdldt    ��� null��  ��  �  �  & m    ��
�� 
TEXT$ o      ���� 0 curyear  " *+* r    ,-, c    ./. n    010 m    ��
�� 
mnth1 l   2����2 I   ������
�� .misccurdldt    ��� null��  ��  ��  ��  / m    ��
�� 
TEXT- o      ���� 0 curmonth  + 343 r    #565 c    !787 n    9:9 1    ��
�� 
day : l   ;����; I   ������
�� .misccurdldt    ��� null��  ��  ��  ��  8 m     ��
�� 
TEXT6 o      ���� 
0 curday  4 <=< r   $ />?> c   $ -@A@ n   $ +BCB 1   ) +��
�� 
timeC l  $ )D����D I  $ )������
�� .misccurdldt    ��� null��  ��  ��  ��  A m   + ,��
�� 
TEXT? o      ���� 0 curtime  = EFE l  0 0��������  ��  ��  F GHG r   0 ;IJI b   0 9KLK b   0 7MNM b   0 5OPO b   0 3QRQ m   0 1SS �TT 
 / t m p /R o   1 2���� 0 curyear  P o   3 4���� 0 curmonth  N o   5 6���� 
0 curday  L o   7 8���� 0 curtime  J o      ���� 0 temppath tempPathH UVU r   < AWXW b   < ?YZY m   < =[[ �\\  m k d i r  Z o   = >���� 0 temppath tempPathX o      ���� 0 	thescript  V ]^] I  B G��_��
�� .sysoexecTEXT���     TEXT_ o   B C���� 0 	thescript  ��  ^ `a` l  H H��������  ��  ��  a bcb Z   H gde����d H   H Off n  H Nghg I   I N��i���� 0 
fileexists 
fileExistsi j��j o   I J���� 0 dpath dPath��  ��  h  f   H Ie k   R ckk lml I  R W��n��
�� .ascrcmnt****      � ****n o   R S���� 0 dpath dPath��  m opo r   X ]qrq b   X [sts m   X Yuu �vv  m k d i r  t o   Y Z���� 0 dpath dPathr o      ���� 0 	thescript  p w��w I  ^ c��x��
�� .sysoexecTEXT���     TEXTx o   ^ _���� 0 	thescript  ��  ��  ��  ��  c yzy l  h h��������  ��  ��  z {|{ Z   h �}~����} H   h o n  h n��� I   i n������� 0 
fileexists 
fileExists� ���� o   i j���� 0 tpath tPath��  ��  �  f   h i~ k   r }�� ��� r   r w��� b   r u��� m   r s�� ���  m k d i r  � o   s t���� 0 tpath tPath� o      ���� 0 	thescript  � ���� I  x }�����
�� .sysoexecTEXT���     TEXT� o   x y���� 0 	thescript  ��  ��  ��  ��  | ��� l  � ���������  ��  ��  � ��� Z   � �������� H   � ��� n  � ���� I   � �������� 0 
fileexists 
fileExists� ���� o   � ����� 0 wpath wPath��  ��  �  f   � �� k   � ��� ��� r   � ���� b   � ���� m   � ��� ���  m k d i r  � o   � ����� 0 wpath wPath� o      ���� 0 	thescript  � ���� I  � ������
�� .sysoexecTEXT���     TEXT� o   � ����� 0 	thescript  ��  ��  ��  ��  � ��� l  � ���������  ��  ��  � ��� l  � �������  �  **** Export the pics ****   � ��� 2 * * * *   E x p o r t   t h e   p i c s   * * * *� ��� O   �E��� t   �D��� k   �C�� ��� I  � �����
�� .rkstrkxpnull���     ****� o   � ����� 0 selectedpics selectedPics� ����
�� 
nmfi� 4   � ����
�� 
rknp� m   � ��� ���  V e r s i o n   N a m e� ����
�� 
faal� 4   � ����
�� 
rkes� m   � ��� ��� ( J P E G   -   O r i g i n a l   S i z e� �����
�� 
insh� o   � ����� 0 temppath tempPath��  � ��� r   � ���� b   � ���� b   � ���� b   � ���� m   � ��� ���  m v  � o   � ����� 0 temppath tempPath� m   � ��� ���  / *  � o   � ����� 0 dpath dPath� o      ���� 0 	thescript  � ��� I  � ������
�� .sysoexecTEXT���     TEXT� o   � ����� 0 	thescript  ��  � ��� I  � �����
�� .rkstrkxpnull���     ****� o   � ����� 0 selectedpics selectedPics� ����
�� 
nmfi� 4   � ����
�� 
rknp� m   � ��� ���  V e r s i o n   N a m e� ����
�� 
faal� 4   � ����
�� 
rkes� m   � ��� ���   J P E G   -   T h u m b n a i l� �����
�� 
insh� o   � ����� 0 temppath tempPath��  � ��� r   ���� b   ���� b   ���� b   � ���� m   � ��� ���  m v  � o   � ����� 0 temppath tempPath� m   ��� ���  / *  � o  ���� 0 tpath tPath� o      ���� 0 	thescript  � ��� I �����
�� .sysoexecTEXT���     TEXT� o  	���� 0 	thescript  ��  � ��� I /����
�� .rkstrkxpnull���     ****� o  ���� 0 selectedpics selectedPics� ����
�� 
nmfi� 4  ���
�� 
rknp� m  �� ���  V e r s i o n   N a m e� ����
�� 
faal� 4  %��
� 
rkes� m  !$�� �   R J P E G   -   F i t   w i t h i n   1 0 2 4   x   1 0 2 4   W a t e r m a r k e d� �~�}
�~ 
insh o  ()�|�| 0 temppath tempPath�}  �  r  0= b  0; b  09	 b  05

 m  03 �  m v   o  34�{�{ 0 temppath tempPath	 m  58 �  / *   o  9:�z�z 0 wpath wPath o      �y�y 0 	thescript   �x I >C�w�v
�w .sysoexecTEXT���     TEXT o  >?�u�u 0 	thescript  �v  �x  � m   � ��t�t� m   � ��                                                                                  fstp  alis    P  
Subversion                 �1ubH+     OAperture.app                                                    
�p��        ����  	                Applications    �1�      �~�Z       O  %Subversion:Applications: Aperture.app     A p e r t u r e . a p p   
 S u b v e r s i o n  Applications/Aperture.app   / ��  �  l FF�s�r�q�s  �r  �q    l FF�p�p   K E**** Get rid of spaces and brackets in filenames (damn you apple)****    � � * * * *   G e t   r i d   o f   s p a c e s   a n d   b r a c k e t s   i n   f i l e n a m e s   ( d a m n   y o u   a p p l e ) * * * *  r  FM J  FK   o  FG�o�o 0 wpath wPath  !"! o  GH�n�n 0 tpath tPath" #�m# o  HI�l�l 0 dpath dPath�m   o      �k�k 0 fixpaths   $%$ X  N~&�j'& k  by(( )*) r  bs+,+ b  bq-.- b  bm/0/ b  bk121 b  bg343 m  be55 �66  f o r   f i l e   i n  4 o  ef�i�i 0 fixpath  2 m  gj77 �88 � / * ;   d o   o l d = ` b a s e n a m e   " $ f i l e " ` ;   n e w = $ { o l d / / [   ) ] / } ;   n e w = $ { n e w / / [ ( ] / _ } ;   i f   [   - f   " $ f i l e "   ] ;   t h e n   m v   " $ f i l e "  0 o  kl�h�h 0 fixpath  . m  mp99 �::  / $ n e w ;   f i ;   d o n e, o      �g�g 0 	thescript  * ;�f; I ty�e<�d
�e .sysoexecTEXT���     TEXT< o  tu�c�c 0 	thescript  �d  �f  �j 0 fixpath  ' o  QR�b�b 0 fixpaths  % =>= l �a�`�_�a  �`  �_  > ?@? r  �ABA b  �CDC m  �EE �FF  r m d i r  D o  ���^�^ 0 temppath tempPathB o      �]�] 0 	thescript  @ G�\G I ���[H�Z
�[ .sysoexecTEXT���     TEXTH o  ���Y�Y 0 	thescript  �Z  �\   IJI l     �X�W�V�X  �W  �V  J KLK i   # &MNM I      �UO�T�U 60 exporthandwatermarkedpics exportHandWatermarkedPicsO PQP o      �S�S ,0 watermarkedselection watermarkedSelectionQ RSR o      �R�R 0 databasepath databasePathS T�QT o      �P�P 0 wpath wPath�Q  �T  N Z     VUV�O�NU l    W�M�LW ?    XYX l    Z�K�JZ I    �I[�H
�I .corecnte****       ****[ o     �G�G ,0 watermarkedselection watermarkedSelection�H  �K  �J  Y m    �F�F  �M  �L  V k   
 R\\ ]^] r   
 _`_ b   
 aba b   
 cdc m   
 ee �ff  m k d i r   - p  d o    �E�E 0 wpath wPathb m    gg �hh  / t m p` o      �D�D 0 	thescript  ^ iji I   �Ck�B
�C .sysoexecTEXT���     TEXTk o    �A�A 0 	thescript  �B  j lml O    0non k    /pp qrq l   �@st�@  s S Mexport to a temporary directory because export won't overwrite existing files   t �uu � e x p o r t   t o   a   t e m p o r a r y   d i r e c t o r y   b e c a u s e   e x p o r t   w o n ' t   o v e r w r i t e   e x i s t i n g   f i l e sr v�?v I   /�>wx
�> .rkstrkxpnull���     ****w o    �=�= ,0 watermarkedselection watermarkedSelectionx �<yz
�< 
nmfiy 4    "�;{
�; 
rknp{ m     !|| �}}  V e r s i o n   N a m ez �:~
�: 
faal~ 4   # '�9�
�9 
rkes� m   % &�� ��� ( J P E G   -   O r i g i n a l   S i z e �8��7
�8 
insh� b   ( +��� o   ( )�6�6 0 wpath wPath� m   ) *�� ���  / t m p�7  �?  o m    ���                                                                                  fstp  alis    P  
Subversion                 �1ubH+     OAperture.app                                                    
�p��        ����  	                Applications    �1�      �~�Z       O  %Subversion:Applications: Aperture.app     A p e r t u r e . a p p   
 S u b v e r s i o n  Applications/Aperture.app   / ��  m ��� l  1 1�5���5  � ^ X Now move the exported file on top of the existing exports and delete the temp directory   � ��� �   N o w   m o v e   t h e   e x p o r t e d   f i l e   o n   t o p   o f   t h e   e x i s t i n g   e x p o r t s   a n d   d e l e t e   t h e   t e m p   d i r e c t o r y� ��� r   1 F��� b   1 D��� b   1 @��� b   1 >��� b   1 :��� b   1 8��� b   1 4��� m   1 2�� ���  m v   - f  � o   2 3�4�4 0 wpath wPath� m   4 7�� ���  / t m p / *  � o   8 9�3�3 0 wpath wPath� m   : =�� ���  ;   r m   - r  � o   > ?�2�2 0 wpath wPath� m   @ C�� ���  / t m p� o      �1�1 0 	thescript  � ��� l  G G�0���0  � ; 5set thescript to "cp -f " & wPath & "/tmp/* " & wPath   � ��� j s e t   t h e s c r i p t   t o   " c p   - f   "   &   w P a t h   &   " / t m p / *   "   &   w P a t h� ��� I  G L�/��.
�/ .sysoexecTEXT���     TEXT� o   G H�-�- 0 	thescript  �.  � ��,� I  M R�+��*
�+ .ascrcmnt****      � ****� o   M N�)�) 0 	thescript  �*  �,  �O  �N  L ��� l     �(�'�&�(  �'  �&  � ��%� i   ' *��� I      �$�#�"�$ 0 
getlibpath 
getLibPath�#  �"  � k     \�� ��� O    ��� r    ��� n    ��� 1    �!
�! 
valL� n    ��� 4    � �
�  
plii� m    �� ���  L i b r a r y P a t h� 4    ��
� 
plif� l   ���� b    ��� l   ���� I   ���
� .earsffdralis        afdr� m    �
� afdrpref� ���
� 
rtyp� m    	�
� 
utxt�  �  �  � m    �� ��� 0 c o m . a p p l e . A p e r t u r e . p l i s t�  �  � o      �� 0 	p_libpath 	p_libPath� m     ���                                                                                  sevs  alis    �  
Subversion                 �1ubH+     2System Events.app                                               0��a9        ����  	                CoreServices    �1�      ���       2   ,   +  ;Subversion:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p   
 S u b v e r s i o n  -System/Library/CoreServices/System Events.app   / ��  � ��� l   ����  �  �  � ��� Z    \����� l   $���� >   $��� l   "���� I   "��
�
� .sysooffslong    ��� null�
  � �	��
�	 
psof� m    �� ���  ~� ���
� 
psin� o    �� 0 	p_libpath 	p_libPath�  �  �  � m   " #��  �  �  � k   ' W�� ��� r   ' *��� m   ' (�� ���  / b i n / e c h o   $ H O M E� o      �� 0 p_script  � ��� r   + 2��� l  + 0���� I  + 0��� 
� .sysoexecTEXT���     TEXT� o   + ,���� 0 p_script  �   �  �  � o      ���� 0 
p_homepath 
p_homePath� ��� l  3 3��������  ��  ��  � ��� r   3 @��� I  3 >�����
�� .sysooffslong    ��� null��  � ����
�� 
psof� m   5 8�� ���  ~� �����
�� 
psin� o   9 :���� 0 	p_libpath 	p_libPath��  � o      ���� 0 p_offset  � ��� r   A R��� n   A P��� 7  B P����
�� 
ctxt� l  H L������ [   H L   o   I J���� 0 p_offset   m   J K���� ��  ��  � m   M O������� o   A B���� 0 	p_libpath 	p_libPath� o      ���� 
0 p_path  �  l  S S��������  ��  ��   �� L   S W b   S V o   S T���� 0 
p_homepath 
p_homePath o   T U���� 
0 p_path  ��  �  � L   Z \ o   Z [���� 0 	p_libpath 	p_libPath�  �%  3 ��	8
��  	 ������������������������ 	0 p_sql  �� 0 
fileexists 
fileExists�� 0 folderexists  �� 0 monthtointeger  �� 0 monthtostring  �� 0 chooseproject chooseProject�� 0 
seturgency 
setUrgency�� 0 addlinks addLinks�� 0 
exportpics 
exportPics�� 60 exporthandwatermarkedpics exportHandWatermarkedPics�� 0 
getlibpath 
getLibPath
 ��?�������� 0 
fileexists 
fileExists�� ����   ���� 0 	posixpath 	posixPath��   ���� 0 	posixpath 	posixPath N��R������
�� 
strq
�� .sysoexecTEXT���     TEXT
�� 
long
�� 
bool�� ��,%�%j �&�& ��Y�������� 0 folderexists  �� ����   ������ 0 
folderyear  �� 0 foldermonth  ��   ������ 0 
folderyear  �� 0 foldermonth   s����
�� 
rkfl
�� .coredoexnull���     ****�� 2� .*�/j  *�/ *�/j  eY fUY hOfU ��}�������� 0 monthtointeger  �� ����   ���� 0 monthstring  ��   ���� 0 monthstring   ��������
�� 
ldt 
�� 
mnth
�� 
long�� *��%�%/�,�& ����������� 0 monthtostring  �� ����   ���� 0 monthint  ��   ���� 0 monthint   ��������
�� 
ldt 
�� 
mnth
�� 
TEXT�� *��%�%/�,�& ������� !���� 0 chooseproject chooseProject�� ��"�� "  ���� 0 adate aDate��    ������������������������ 0 adate aDate�� 0 curyear  �� 0 curmonth  �� 
0 curday  �� 0 curtime  �� 0 monthexists  �� 0 changemonthmessage  �� 0 changeyearmessage  �� 0 choosenproject  �� 0 pr  �� 0 x  ! �����������������������#������M#jnz
�� 
year
�� 
TEXT
�� 
mnth
�� 
day 
�� 
time�� 0 folderexists  
�� 
rkfl
�� 
rkpj
�� 
pnam
�� 
prmp
�� .gtqpchltns    @   @ ns  
�� 
rslt
�� 
cobj#  ����,�&E�O��,�&E�O��,�&E�O��,�&E�O*��l+  eE�Y fE�O�E�O�E�OfE�O�E�O� � �h�� 7*�/ ,*�/ $eE�O*�-�,EE�O��6FO���l O�a k/E�UUY hO��  0fE�O*�/ !*�-�,E�O��6FO��a l O�a k/E�UY hO��  =*�-�,a [[�,\Za @C\[�,\Za >A1E�O��a l O�a k/E�OfE�Y eE�[OY�EO�U �������$%���� 0 
seturgency 
setUrgency�� ��&�� &  ���� 0 pr  ��  $ ���� 0 pr  % ����#���������������������������
�� 
rkpj
�� 
rkdp
�� 
rkmr�� 
�� 
kocl
�� 
rkip
�� 
prdt
�� 
pnam
�� 
rkvl�� 
� .corecrel****      � null�� �� �*�/ �*�-�[�,\Z�81 *��������� UO*�-�[�,\Z�81 *������a �� UO*�-�[�,\Zm81 *����a �a �� UO*�-�[�,\Zl81 *����a �a �� UO*�-�[�,\Zk81 *����a �a �� UUU �~�}�|'(�{�~ 0 addlinks addLinks�} �z)�z )  �y�x�w
�y 
sele�x 0 	linkspath 	linksPath�w 0 databasepath databasePath�|  ' �v�u�t�s�r�q�p�o�n�m�l�k�j�i�h�g
�v 
sele�u 0 	linkspath 	linksPath�t 0 databasepath databasePath�s 0 	thescript  �r 0 theout theOut�q 
0 curimg  �p 0 isref isRef�o 0 curid curID�n 0 curname  �m 0 
mastername 
masterName�l 0 newline newLine�k 0 	zfileuuid 	ZFILEUUID�j 0 
zimagepath 
ZIMAGEPATH�i "0 zfilevolumeuuid ZFILEVOLUMEUUID�h 0 diskname diskName�g 0 imgpath imgPath( �f%�e�d�c�b�a�`�_�^�]Q�\]�[wy�����������Z�Y�f 0 
fileexists 
fileExists
�e .sysoexecTEXT���     TEXT
�d 
ret 
�c 
kocl
�b 
cobj
�a .corecnte****       ****
�` 
rkrd
�_ 
ID  
�^ 
pnam
�] 
rkot
�\ 
rkvl
�[ 
strq�Z  �Y  �{ )�k+   �%E�O�j Y hO�E�O� � ��[��l kh ��,E�O��,E�O��,E�O���/�,E�O��%E�O�e  �b   ��,%a %�%a %E�O�j E�Ob   ��,%a %�%a %E�O�j E�Ob   ��,%a %�%a %E�O�j E�Ob   ��,%a %�%a %E�O�j E�Oa �%E�Oa ��,%a %�%a %��,%E�O 
�j W X  hY hO��%E�O��%�%E�OP[OY�UO� �X�W�V*+�U�X 0 
exportpics 
exportPics�W �T,�T ,  �S�R�Q�P�O�S 0 selectedpics selectedPics�R 0 databasepath databasePath�Q 0 dpath dPath�P 0 tpath tPath�O 0 wpath wPath�V  * �N�M�L�K�J�I�H�G�F�E�D�C�B�N 0 selectedpics selectedPics�M 0 databasepath databasePath�L 0 dpath dPath�K 0 tpath tPath�J 0 wpath wPath�I 0 curyear  �H 0 curmonth  �G 
0 curday  �F 0 curtime  �E 0 temppath tempPath�D 0 	thescript  �C 0 fixpaths  �B 0 fixpath  + *�A�@�?�>�=�<S[�;�:�9u���8�7�6��5�4��3�2�1���������0�/�.579E
�A .misccurdldt    ��� null
�@ 
year
�? 
TEXT
�> 
mnth
�= 
day 
�< 
time
�; .sysoexecTEXT���     TEXT�: 0 
fileexists 
fileExists
�9 .ascrcmnt****      � ****�8
�7 
nmfi
�6 
rknp
�5 
faal
�4 
rkes
�3 
insh�2 
�1 .rkstrkxpnull���     ****
�0 
kocl
�/ 
cobj
�. .corecnte****       ****�U�*j  �,�&E�O*j  �,�&E�O*j  �,�&E�O*j  �,�&E�O�%�%�%�%E�O�%E�O�j O)�k+ 	 �j 
O�%E�O�j Y hO)�k+ 	 �%E�O�j Y hO)�k+ 	 ��%E�O�j Y hO� ��n�a *a a /a *a a /a �a  Oa �%a %�%E�O�j O�a *a a /a *a a /a �a  Oa �%a %�%E�O�j O�a *a a /a *a a  /a �a  Oa !�%a "%�%E�O�j oUO���mvE�O /�[a #a $l %kh a &�%a '%�%a (%E�O�j [OY��Oa )�%E�O�j  �-N�,�+-.�*�- 60 exporthandwatermarkedpics exportHandWatermarkedPics�, �)/�) /  �(�'�&�( ,0 watermarkedselection watermarkedSelection�' 0 databasepath databasePath�& 0 wpath wPath�+  - �%�$�#�"�% ,0 watermarkedselection watermarkedSelection�$ 0 databasepath databasePath�# 0 wpath wPath�" 0 	thescript  . �!eg� ���|������������
�! .corecnte****       ****
�  .sysoexecTEXT���     TEXT
� 
nmfi
� 
rknp
� 
faal
� 
rkes
� 
insh� 
� .rkstrkxpnull���     ****
� .ascrcmnt****      � ****�* W�j  j M�%�%E�O�j O� ��*��/�*��/��%� UO�%a %�%a %�%a %E�O�j O�j Y h ����01�� 0 
getlibpath 
getLibPath�  �  0 ������ 0 	p_libpath 	p_libPath� 0 p_script  � 0 
p_homepath 
p_homePath� 0 p_offset  � 
0 p_path  1 ������
��	�����������
� 
plif
� afdrpref
� 
rtyp
� 
utxt
�
 .earsffdralis        afdr
�	 
plii
� 
valL
� 
psof
� 
psin� 
� .sysooffslong    ��� null
� .sysoexecTEXT���     TEXT
� 
ctxt� ]� *����l �%/��/�,E�UO*���� j 5�E�O�j E�O*�a �� E�O�[a \[Z�k\Zi2E�O��%Y �� �22 ^ / U s e r s / i a i n / P i c t u r e s / A p e r t u r e   L i b r a r y . a p l i b r a r y� �33  
�" boovfals� �44 ^ / U s e r s / i a i n / P i c t u r e s / A p e r t u r e   L i b r a r y . a p l i b r a r y� �55 � / U s e r s / i a i n / P i c t u r e s / A p e r t u r e   L i b r a r y . a p l i b r a r y / D a t a b a s e / L i b r a r y . a p d b� �66  2 0� �77 
 6 5 9 1 8
�! boovtrue
�  boovtrue� �88   1 7 - t o o - m a n y - f i s h� �9� 	9  :;<=>?@A �� ����������������������������: �BB   0 3 - T o d d s - F r i e n d s; �CC  0 5 - 3 - i n - 1< �DD  1 0 - 2 - i n - 1= �EE  1 2 - R a i n> �FF  1 5 - S q u i d l i n g s? �GG   1 7 - t o o - m a n y - f i s h@ �HH D 1 9 - K i d s - f l o w e r s - a n d - a - s c a r y - b r i d g eA �II  2 3 - Z e r o - b a r�   ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  � �JJ  0 4� �KK n / U s e r s / i a i n / P i c t u r e s / P u b l i s h e d / 2 0 1 3 / 0 4 / 1 7 - t o o - m a n y - f i s h  �LL > / t m p / P u b l i s h e d / 2 0 1 3 A p r i l 2 0 6 5 9 1 8 �MM ~ / U s e r s / i a i n / P i c t u r e s / P u b l i s h e d / 2 0 1 3 / 0 4 / 1 7 - t o o - m a n y - f i s h / m a s t e r s �NN | / U s e r s / i a i n / P i c t u r e s / P u b l i s h e d / 2 0 1 3 / 0 4 / 1 7 - t o o - m a n y - f i s h / t h u m b s �OO � / U s e r s / i a i n / P i c t u r e s / P u b l i s h e d / 2 0 1 3 / 0 4 / 1 7 - t o o - m a n y - f i s h / w a t e r m a r k e d �PP  e c h o   " T o o   m a n y   f i s h   i s   a   q u o t e   f r o m   o n e   o f   t h e   g u i d e s .   T h i n k   i t   w a s   M r   A n h .   T h e r e   w e r e   r a t h e r   a   l o t   o u t   t o d a y .   T h e   r e d   h e a d s c a r f   w a s   i n   p r o t e s t   a b o u t   t h e   a m o u n t   s p e n t   o n   T h a t c h e r s   f u n e r a l . " >   / U s e r s / i a i n / P i c t u r e s / P u b l i s h e d / 2 0 1 3 / 0 4 / 1 7 - t o o - m a n y - f i s h / n o t e s . t x t �QQl T o o   m a n y   f i s h   i s   a   q u o t e   f r o m   o n e   o f   t h e   g u i d e s .   T h i n k   i t   w a s   M r   A n h .   T h e r e   w e r e   r a t h e r   a   l o t   o u t   t o d a y .   T h e   r e d   h e a d s c a r f   w a s   i n   p r o t e s t   a b o u t   t h e   a m o u n t   s p e n t   o n   T h a t c h e r s   f u n e r a l . ��R�� R  STUVS WW X��Y��X f��Z��
�� 
rkpjZ �[[ , R S p I o X N U T M e c p F T 8 + Z G M W A
�� kfrmID  
�� 
rkdpY �\\ , s W U + m 4 9 8 T + + B W r Q W Y G X 7 Z w
�� kfrmID  T ]] ^��_��^ f��`��
�� 
rkpj` �aa , R S p I o X N U T M e c p F T 8 + Z G M W A
�� kfrmID  
�� 
rkdp_ �bb , R N 4 a % A Z c T 0 6 C H T c A d K f y Q A
�� kfrmID  U cc d��e��d f��f��
�� 
rkpjf �gg , R S p I o X N U T M e c p F T 8 + Z G M W A
�� kfrmID  
�� 
rkdpe �hh , C U k p o k 3 Q Q 1 K X f t r x Z e Q m M Q
�� kfrmID  V ii j��k��j f��l��
�� 
rkpjl �mm , R S p I o X N U T M e c p F T 8 + Z G M W A
�� kfrmID  
�� 
rkdpk �nn , t w S 5 r A O s S V W c t g w w W j w E I Q
�� kfrmID   ��o�� o  pqp rr s��t��s f��u��
�� 
rkpju �vv , R S p I o X N U T M e c p F T 8 + Z G M W A
�� kfrmID  
�� 
rkdpt �ww , s Z f 6 E c j T S Q S I R 2 d l k m g S y Q
�� kfrmID  q xx y��z��y f��{��
�� 
rkpj{ �|| , R S p I o X N U T M e c p F T 8 + Z G M W A
�� kfrmID  
�� 
rkdpz �}} , p 9 g q q n T r Q e 2 6 % J t v o i q X j A
�� kfrmID  �  ascr  ��ޭ