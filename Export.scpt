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
libDBPOSIX��  ��   n  y z y l     ��������  ��  ��   z  { | { l     ��������  ��  ��   |  } ~ } l  ] d ����  r   ] d � � � m   ] ` � � � � � < / U s e r s / i a i n / P i c t u r e s / P u b l i s h e d � o      ���� 0 publishedpath PublishedPath��  ��   ~  � � � l     �� � ���   � ' !set BackupDir to "/tmp/Published"    � � � � B s e t   B a c k u p D i r   t o   " / t m p / P u b l i s h e d " �  � � � l     ��������  ��  ��   �  � � � l  e t ����� � r   e t � � � c   e p � � � n   e n � � � 1   j n��
�� 
day  � l  e j ����� � I  e j������
�� .misccurdldt    ��� null��  ��  ��  ��   � m   n o��
�� 
TEXT � o      ���� 
0 curday  ��  ��   �  � � � l  u � ����� � r   u � � � � c   u � � � � n   u ~ � � � 1   z ~��
�� 
time � l  u z ����� � I  u z������
�� .misccurdldt    ��� null��  ��  ��  ��   � m   ~ ��
�� 
TEXT � o      ���� 0 curtime  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � * $************************************    � � � � H * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * �  � � � l  � � ����� � Z   � � � ��� � � n   � � � � � I   � �� ��~� 0 folderexists   �  � � � o   � ��}�} 0 curyear   �  ��| � o   � ��{�{ 0 curmonth  �|  �~   � o   � ��z�z *0 loadedexportlibrary loadedExportLibrary � r   � � � � � m   � ��y
�y boovtrue � o      �x�x 0 monthexists  ��   � r   � � � � � m   � ��w
�w boovfals � o      �v�v 0 monthexists  ��  ��   �  � � � l     �u�t�s�u  �t  �s   �  � � � l  � � ��r�q � r   � � � � � m   � � � � � � � $ * *   C h a n g e   m o n t h   * * � o      �p�p 0 changemonthmessage  �r  �q   �  � � � l  � � ��o�n � r   � � � � � m   � � � � � � � " * *   C h a n g e   y e a r   * * � o      �m�m 0 changeyearmessage  �o  �n   �  � � � l  � � ��l�k � r   � � � � � m   � ��j
�j boovfals � o      �i�i 0 choosenproject  �l  �k   �  � � � l  � � ��h�g � r   � � � � � o   � ��f�f 0 changemonthmessage   � o      �e�e 0 pr  �h  �g   �  � � � l     �d�c�b�d  �c  �b   �  � � � l  �� ��a�` � O   �� � � � V   �� � � � k   �� � �  � � � l  � ��_ � ��_   � / )if curmonth is not changeyearmessage then    � � � � R i f   c u r m o n t h   i s   n o t   c h a n g e y e a r m e s s a g e   t h e n �  � � � Z   �  � ��^�] � o   � ��\�\ 0 monthexists   � O   � � � � O   � � � � k   � � �  � � � r   � � � � � m   � ��[
�[ boovtrue � o      �Z�Z 0 choosenproject   �  � � � r   � � � � � e   � � � � n   � � � � � 1   � ��Y
�Y 
pnam � 2   � ��X
�X 
rkpj � o      �W�W 0 x   �  � � � r   � � � � � o   � ��V�V 0 changemonthmessage   � n       � � �  ;   � � � o   � ��U�U 0 x   �  � � � I  �T � �
�T .gtqpchltns    @   @ ns   � o   �S�S 0 x   � �R ��Q
�R 
prmp � m  	 � � � � �   C h o o s e   a   p r o j e c t�Q   �  �P  r   n   4  �O
�O 
cobj m  �N�N  1  �M
�M 
rslt o      �L�L 0 pr  �P   � 4   � ��K
�K 
rkfl o   � ��J�J 0 curmonth   � 4   � ��I
�I 
rkfl o   � ��H�H 0 curyear  �^  �]   � 	 Z  !n
�G�F
 = !( o  !$�E�E 0 pr   o  $'�D�D 0 changemonthmessage   k  +j  r  +0 m  +,�C
�C boovfals o      �B�B 0 choosenproject   �A O  1j k  :i  r  :G n  :C 1  ?C�@
�@ 
pnam 2  :?�?
�? 
rkfl o      �>�> 0 x    r  HP  o  HK�=�= 0 changeyearmessage    n      !"!  ;  NO" o  KN�<�< 0 x   #$# I Q^�;%&
�; .gtqpchltns    @   @ ns  % o  QT�:�: 0 x  & �9'�8
�9 
prmp' m  WZ(( �))  c h o o s e   m o n t h�8  $ *�7* r  _i+,+ n  _g-.- 4  bg�6/
�6 
cobj/ m  ef�5�5 . 1  _b�4
�4 
rslt, o      �3�3 0 curmonth  �7   4  17�20
�2 
rkfl0 o  56�1�1 0 curyear  �A  �G  �F  	 1�01 Z  o�23�/42 = ot565 o  op�.�. 0 curmonth  6 o  ps�-�- 0 changeyearmessage  3 k  w�77 898 r  w�:;: 6w�<=< n  w�>?> 1  |��,
�, 
pnam? 2  w|�+
�+ 
rkfl= F  ��@A@ H  ��BB E  ��CDC 1  ���*
�* 
pnamD m  ��EE �FF  -A C  ��GHG 1  ���)
�) 
pnamH m  ��II �JJ  2; o      �(�( 0 x  9 KLK l ���'MN�'  M J D Lazy programming. Must get round to fixing it before the year 3000.   N �OO �   L a z y   p r o g r a m m i n g .   M u s t   g e t   r o u n d   t o   f i x i n g   i t   b e f o r e   t h e   y e a r   3 0 0 0 .L PQP I ���&RS
�& .gtqpchltns    @   @ ns  R o  ���%�% 0 x  S �$T�#
�$ 
prmpT m  ��UU �VV  c h o o s e   y e a r�#  Q WXW r  ��YZY n  ��[\[ 4  ���"]
�" 
cobj] m  ���!�! \ 1  ��� 
�  
rsltZ o      �� 0 curyear  X ^�^ r  ��_`_ m  ���
� boovfals` o      �� 0 monthexists  �  �/  4 r  ��aba m  ���
� boovtrueb o      �� 0 monthexists  �0   � H   � �cc o   � ��� 0 choosenproject   � m   � �dd�                                                                                  fstp  alis    P  
Subversion                 �1ubH+     OAperture.app                                                    
�p��        ����  	                Applications    �1�      �~�Z       O  %Subversion:Applications: Aperture.app     A p e r t u r e . a p p   
 S u b v e r s i o n  Applications/Aperture.app   / ��  �a  �`   � efe l     ����  �  �  f ghg l ��i��i r  ��jkj c  ��lml n  ��non I  ���p�� 0 monthtointeger  p q�q o  ���� 0 curmonth  �  �  o o  ���� *0 loadedexportlibrary loadedExportLibrarym m  ���
� 
TEXTk o      �� 0 monthint  �  �  h rsr l ��t��t Z  ��uv�
�	u = ��wxw n  ��yzy 1  ���
� 
lengz o  ���� 0 monthint  x m  ���� v r  ��{|{ b  ��}~} m  �� ���  0~ o  ���� 0 monthint  | o      �� 0 monthint  �
  �	  �  �  s ��� l     ����  �  �  � ��� l ��� ��� r  ���� b  �
��� b  ���� b  ���� b  ����� o  ������ 0 curyear  � m  ���� ���  /� o  ����� 0 monthint  � m  �� ���  /� o  	���� 0 pr  � o      ���� 0 ymp  �   ��  � ��� l ������ r  ��� b  ��� b  ��� o  ���� 0 publishedpath PublishedPath� m  �� ���  / f u l l s i z e /� o  ���� 0 ymp  � o      ���� 0 fullsizepath fullsizePath��  ��  � ��� l .������ r  .��� b  *��� b  &��� o  "���� 0 publishedpath PublishedPath� m  "%�� ���  / m a s t e r s /� o  &)���� 0 ymp  � o      ���� 0 masterspath mastersPath��  ��  � ��� l />������ r  />��� b  /:��� b  /6��� o  /2���� 0 publishedpath PublishedPath� m  25�� ���  / t h u m b s /� o  69���� 0 ymp  � o      ���� 0 
thumbspath 
thumbsPath��  ��  � ��� l ?N������ r  ?N��� b  ?J��� b  ?F��� o  ?B���� 0 publishedpath PublishedPath� m  BE�� ���  / w a t e r m a r k e d /� o  FI���� 0 ymp  � o      ���� "0 watermarkedpath watermarkedPath��  ��  � ��� l     ��������  ��  ��  � ��� l O������� O  O���� O  U���� k  `��� ��� l ``������  �   get the project notes   � ��� ,   g e t   t h e   p r o j e c t   n o t e s� ��� r  `��� b  `{��� b  `w��� b  `q��� b  `m��� o  `e���� 	0 p_sql  � l el������ n  el��� 1  hl��
�� 
strq� o  eh���� 0 
libdbposix 
libDBPOSIX��  ��  � m  mp�� ��� `   " s e l e c t   n o t e   f r o m   R K N O T E   w h e r e   A T T A C H E D T O U U I D = '� 1  qv��
�� 
ID  � m  wz�� ���  ' "� o      ���� 0 	thescript  � ��� r  ����� I �������
�� .sysoexecTEXT���     TEXT� o  ������ 0 	thescript  ��  � o      ���� 	0 notes  � ��� l ����������  ��  ��  � ��� r  ����� c  ����� l �������� 6����� 2  ����
�� 
rkdp� G  ����� l �������� ? ����� 1  ����
�� 
rkmr� m  ������ ��  ��  � l �������� = ����� 1  ����
�� 
rkvc� m  ����
�� rkclrkRD��  ��  ��  ��  � m  ����
�� 
list� o      ���� 
0 cursel  � ��� r  ����� c  ����� l �� ����  6 �� 2  ����
�� 
rkdp E  �� n  �� 1  ����
�� 
pnam 2  ����
�� 
rkkw m  �� �  B o r d e r F X��  ��  � m  ����
�� 
list� o      ���� 0 watermarkedsel  � 	
	 l ����������  ��  ��  
 �� n  �� I  �������� 0 
seturgency 
setUrgency �� o  ������ 0 pr  ��  ��   o  ������ *0 loadedexportlibrary loadedExportLibrary��  � 4  U]��
�� 
rkpj o  Y\���� 0 pr  � m  OR�                                                                                  fstp  alis    P  
Subversion                 �1ubH+     OAperture.app                                                    
�p��        ����  	                Applications    �1�      �~�Z       O  %Subversion:Applications: Aperture.app     A p e r t u r e . a p p   
 S u b v e r s i o n  Applications/Aperture.app   / ��  ��  ��  �  l     ��������  ��  ��    l     ����    delete the old versions    � . d e l e t e   t h e   o l d   v e r s i o n s  l ����� Z  ����� n  �� I  ���� ���� 0 
fileexists 
fileExists  !��! n  ��"#" 1  ����
�� 
psxp# o  ������ 0 fullsizepath fullsizePath��  ��   o  ������ *0 loadedexportlibrary loadedExportLibrary k  �$$ %&% r  ��'(' b  ��)*) m  ��++ �,,  r m   - r  * o  ������ 0 fullsizepath fullsizePath( o      ���� 0 	thescript  & -��- I ���.��
�� .sysoexecTEXT���     TEXT. o  ������ 0 	thescript  ��  ��  ��  ��  ��  ��   /0/ l     ��������  ��  ��  0 121 l .3����3 Z  .45����4 n  676 I  	��8���� 0 
fileexists 
fileExists8 9��9 n  	:;: 1  ��
�� 
psxp; o  	���� 0 
thumbspath 
thumbsPath��  ��  7 o  	���� *0 loadedexportlibrary loadedExportLibrary5 k  *<< =>= r  "?@? b  ABA m  CC �DD  r m   - r  B o  ���� 0 
thumbspath 
thumbsPath@ o      ���� 0 	thescript  > E��E I #*��F��
�� .sysoexecTEXT���     TEXTF o  #&���� 0 	thescript  ��  ��  ��  ��  ��  ��  2 GHG l     ��������  ��  ��  H IJI l /UK����K Z  /ULM����L n  /;NON I  0;��P���� 0 
fileexists 
fileExistsP Q��Q n  07RSR 1  37��
�� 
psxpS o  03���� 0 masterspath mastersPath��  ��  O o  /0���� *0 loadedexportlibrary loadedExportLibraryM k  >QTT UVU r  >IWXW b  >EYZY m  >A[[ �\\  r m   - r  Z o  AD�� 0 masterspath mastersPathX o      �~�~ 0 	thescript  V ]�}] I JQ�|^�{
�| .sysoexecTEXT���     TEXT^ o  JM�z�z 0 	thescript  �{  �}  ��  ��  ��  ��  J _`_ l     �y�x�w�y  �x  �w  ` aba l V|c�v�uc Z  V|de�t�sd n  Vbfgf I  Wb�rh�q�r 0 
fileexists 
fileExistsh i�pi n  W^jkj 1  Z^�o
�o 
psxpk o  WZ�n�n "0 watermarkedpath watermarkedPath�p  �q  g o  VW�m�m *0 loadedexportlibrary loadedExportLibrarye k  exll mnm r  epopo b  elqrq m  ehss �tt  r m   - r  r o  hk�l�l "0 watermarkedpath watermarkedPathp o      �k�k 0 	thescript  n u�ju I qx�iv�h
�i .sysoexecTEXT���     TEXTv o  qt�g�g 0 	thescript  �h  �j  �t  �s  �v  �u  b wxw l     �f�e�d�f  �e  �d  x yzy l     �c{|�c  {   make the directories   | �}} *   m a k e   t h e   d i r e c t o r i e sz ~~ l }���b�a� r  }���� b  }���� b  }���� b  }���� b  }���� b  }���� b  }���� b  }���� m  }��� ���  m k d i r   - p  � o  ���`�` 0 
thumbspath 
thumbsPath� m  ���� ���  ;   m k d i r   - p  � o  ���_�_ "0 watermarkedpath watermarkedPath� m  ���� ���   / t m p   ;   m k d i r   - p  � o  ���^�^ 0 masterspath mastersPath� m  ���� ���  ;   m k d i r   - p  � o  ���]�] 0 fullsizepath fullsizePath� o      �\�\ 0 	thescript  �b  �a   ��� l     �[���[  � L Fmaking thumbspath with the -p option causes fullsizePath to be created   � ��� � m a k i n g   t h u m b s p a t h   w i t h   t h e   - p   o p t i o n   c a u s e s   f u l l s i z e P a t h   t o   b e   c r e a t e d� ��� l ����Z�Y� I ���X��W
�X .sysoexecTEXT���     TEXT� o  ���V�V 0 	thescript  �W  �Z  �Y  � ��� l     �U�T�S�U  �T  �S  � ��� l     �R���R  �   **** export the notes ****   � ��� 4 * * * *   e x p o r t   t h e   n o t e s   * * * *� ��� l ����Q�P� r  ����� b  ����� b  ����� b  ����� b  ����� m  ���� ���  e c h o   "� o  ���O�O 	0 notes  � m  ���� ���  " >  � o  ���N�N 0 fullsizepath fullsizePath� m  ���� ���  / n o t e s . t x t� o      �M�M 0 	thescript  �Q  �P  � ��� l ����L�K� I ���J��I
�J .sysoexecTEXT���     TEXT� o  ���H�H 0 	thescript  �I  �L  �K  � ��� l     �G�F�E�G  �F  �E  � ��� l     �D���D  �  **** Export the pics ****   � ��� 2 * * * *   E x p o r t   t h e   p i c s   * * * *� ��� l ����C�B� n  ����� I  ���A��@�A 0 
exportpics 
exportPics� ��� o  ���?�? 
0 cursel  � ��� o  ���>�> 0 
libdbposix 
libDBPOSIX� ��� o  ���=�= 0 fullsizepath fullsizePath� ��� o  ���<�< 0 
thumbspath 
thumbsPath� ��;� o  ���:�: "0 watermarkedpath watermarkedPath�;  �@  � o  ���9�9 *0 loadedexportlibrary loadedExportLibrary�C  �B  � ��� l     �8�7�6�8  �7  �6  � ��� l     �5���5  � \ V**** Export the hand watermarked pics to replace the automatically generated ones ****   � ��� � * * * *   E x p o r t   t h e   h a n d   w a t e r m a r k e d   p i c s   t o   r e p l a c e   t h e   a u t o m a t i c a l l y   g e n e r a t e d   o n e s   * * * *� ��� l ����4�3� n  ����� I  ���2��1�2 60 exporthandwatermarkedpics exportHandWatermarkedPics� ��� o  ���0�0 0 watermarkedsel  � ��� o  ���/�/ 0 
libdbposix 
libDBPOSIX� ��.� o  ���-�- "0 watermarkedpath watermarkedPath�.  �1  � o  ���,�, *0 loadedexportlibrary loadedExportLibrary�4  �3  � ��� l     �+�*�)�+  �*  �)  � ��� l     �(���(  � $ **** Add links to masters ****   � ��� < * * * *   A d d   l i n k s   t o   m a s t e r s   * * * *� ��� l ����'�&� n  ����� I  ���%��$�% 0 addlinks addLinks� ��� o  ���#�# 
0 cursel  � ��� o  ���"�" 0 masterspath mastersPath� ��!� o  ��� �  0 
libdbposix 
libDBPOSIX�!  �$  � o  ���� *0 loadedexportlibrary loadedExportLibrary�'  �&  � ��� l     ����  �  �  � ��� l     ����  �  �  �       "�� I�� � �� � ��	
���  �  ��������
�	��������� ����������������������������� 	0 p_sql  
� .aevtoappnull  �   � ****� 0 curyear  � 0 curmonth  � 0 librarypath libraryPath� *0 loadedexportlibrary loadedExportLibrary� 0 	g_libpath 	g_libPath�
 0 theout theOut�	 0 	libcopied 	libCopied� 0 libposix libPOSIX� 0 
libdbposix 
libDBPOSIX� 0 publishedpath PublishedPath� 
0 curday  � 0 curtime  � 0 monthexists  � 0 changemonthmessage  � 0 changeyearmessage  �  0 choosenproject  �� 0 pr  �� 0 x  �� 0 monthint  �� 0 ymp  �� 0 fullsizepath fullsizePath�� 0 masterspath mastersPath�� 0 
thumbspath 
thumbsPath�� "0 watermarkedpath watermarkedPath�� 0 	thescript  �� 	0 notes  �� 
0 cursel  �� 0 watermarkedsel  ��  ��  � ��������
�� .aevtoappnull  �   � **** k    �       1  @  S  Z  a  f    m!!  }""  �##  �$$  �%%  �&&  �''  �((  �))  �** g++ r,, �-- �.. �// �00 �11 �22 33 144 I55 a66 ~77 �88 �99 �:: �;; �<< �����  ��  ��     d�������������������� >�������������������� w�� ��������������� ��� �������d���������� �������(=EIU������������������������������������������������������+C[s���������������
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
libDBPOSIX�� 0 publishedpath PublishedPath
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
cobj=  �� 0 monthtointeger  �� 0 monthint  
�� 
leng�� 0 ymp  �� 0 fullsizepath fullsizePath�� 0 masterspath mastersPath�� 0 
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
exportPics�� 60 exporthandwatermarkedpics exportHandWatermarkedPics�� 0 addlinks addLinks���*j  �,�&E�O*j  �,�&E�O*����l 	�%/E�O�j E�O�j+ E�O_ E` OfE` O�a ,E` O_ a %�&E` Oa E` O*j  a ,�&E` O*j  a ,�&E` O���l+  
eE` Y fE` Oa E`  Oa !E` "OfE` #O_  E` $Oa %h_ #_  Q*a &�/ D*a &�/ :eE` #O*a '-a (,EE` )O_  _ )6FO_ )a *a +l ,O_ -a .k/E` $UUY hO_ $_    DfE` #O*a &�/ 1*a &-a (,E` )O_ "_ )6FO_ )a *a /l ,O_ -a .k/E�UY hO�_ "  O*a &-a (,a 0[[a (,\Za 1@C\[a (,\Za 2>A1E` )O_ )a *a 3l ,O_ -a .k/E�OfE` Y eE` [OY��UO��k+ 4�&E` 5O_ 5a 6,k  a 7_ 5%E` 5Y hO�a 8%_ 5%a 9%_ $%E` :O_ a ;%_ :%E` <O_ a =%_ :%E` >O_ a ?%_ :%E` @O_ a A%_ :%E` BOa % �*a '_ $/ �b   _ a C,%a D%*a E,%a F%E` GO_ Gj HE` IO*a J-a 0[[a K,\Zm:\[a L,\Za M8B1a N&E` OO*a J-a 0[a P-a (,\Za Q@1a N&E` RO�_ $k+ SUUO�_ <a ,k+ T a U_ <%E` GO_ Gj HY hO�_ @a ,k+ T a V_ @%E` GO_ Gj HY hO�_ >a ,k+ T a W_ >%E` GO_ Gj HY hO�_ Ba ,k+ T a X_ B%E` GO_ Gj HY hOa Y_ @%a Z%_ B%a [%_ >%a \%_ <%E` GO_ Gj HOa ]_ I%a ^%_ <%a _%E` GO_ Gj HO�_ O_ _ <_ @_ Ba `+ aO�_ R_ _ Bm+ bO�_ O_ >_ m+ c� �>>  2 0 1 3  �??  M a y�alis    �   
Subversion                 �1ubH+   sɷExportLibrary.scpt                                              ��ͳ�QosasToyS����  	                ApertureExport    �1�      ͳ��     sɷ c �| �  @Subversion:Users: iain: Code: ApertureExport: ExportLibrary.scpt  &  E x p o r t L i b r a r y . s c p t   
 S u b v e r s i o n  1Users/iain/Code/ApertureExport/ExportLibrary.scpt   /    ��   ��@ A��  @ k      BB CDC j     ��E�� 	0 p_sql  E m     FF �GG " / u s r / b i n / s q l i t e 3  D HIH l     ��������  ��  ��  I JKJ i    LML I      ��N���� 0 
fileexists 
fileExistsN O��O o      ���� 0 	posixpath 	posixPath��  ��  M L     PP c     QRQ l    S����S c     TUT l    V����V I    ��W��
�� .sysoexecTEXT���     TEXTW b     XYX b     Z[Z m     \\ �]]  i f   t e s t   - e  [ n    ^_^ 1    ��
�� 
strq_ o    ���� 0 	posixpath 	posixPathY m    `` �aa < ;   t h e n 
 e c h o   1 ; 
 e l s e 
 e c h o   0 ; 
 f i��  ��  ��  U m    ��
�� 
long��  ��  R m    ��
�� 
boolK bcb l     ��������  ��  ��  c ded i    
fgf I      ��h���� 0 folderexists  h iji o      ���� 0 
folderyear  j k��k o      ���� 0 foldermonth  ��  ��  g O     1lml k    0nn opo Z    -qr����q I   ��s��
�� .coredoexnull���     ****s 4    ��t
�� 
rkflt o    ���� 0 
folderyear  ��  r O    )uvu Z    (wx��yw I   ��z��
�� .coredoexnull���     ****z 4    ��{
�� 
rkfl{ o    ���� 0 foldermonth  ��  x L   ! #|| m   ! "��
�� boovtrue��  y L   & (}} m   & '��
�� boovfalsv 4    ��~
�� 
rkfl~ o    ���� 0 
folderyear  ��  ��  p � L   . 0�� m   . /�~
�~ boovfals�  m m     ���                                                                                  fstp  alis    P  
Subversion                 �1ubH+     OAperture.app                                                    
�p��        ����  	                Applications    �1�      �~�Z       O  %Subversion:Applications: Aperture.app     A p e r t u r e . a p p   
 S u b v e r s i o n  Applications/Aperture.app   / ��  e ��� l     �}�|�{�}  �|  �{  � ��� l     �z�y�x�z  �y  �x  � ��� l     �w�v�u�w  �v  �u  � ��� i    ��� I      �t��s�t 0 monthtointeger  � ��r� o      �q�q 0 monthstring  �r  �s  � L     �� c     ��� n     
��� m    
�p
�p 
mnth� 4     �o�
�o 
ldt � l   ��n�m� b    ��� b    ��� m    �� ���  1 /� o    �l�l 0 monthstring  � m    �� ��� 
 / 2 0 1 2�n  �m  � m   
 �k
�k 
long� ��� l     �j�i�h�j  �i  �h  � ��� i    ��� I      �g��f�g 0 monthtostring  � ��e� o      �d�d 0 monthint  �e  �f  � L     �� c     ��� n     
��� m    
�c
�c 
mnth� 4     �b�
�b 
ldt � l   ��a�`� b    ��� b    ��� m    �� ���  1 /� o    �_�_ 0 monthint  � m    �� ��� 
 / 2 0 1 2�a  �`  � m   
 �^
�^ 
TEXT� ��� l     �]�\�[�]  �\  �[  � ��� i    ��� I      �Z��Y�Z 0 chooseproject chooseProject� ��X� o      �W�W 0 adate aDate�X  �Y  � k    �� ��� r     ��� c     ��� n     ��� 1    �V
�V 
year� o     �U�U 0 adate aDate� m    �T
�T 
TEXT� o      �S�S 0 curyear  � ��� r    ��� c    ��� n    ��� m   	 �R
�R 
mnth� o    	�Q�Q 0 adate aDate� m    �P
�P 
TEXT� o      �O�O 0 curmonth  � ��� r    ��� c    ��� n    ��� 1    �N
�N 
day � o    �M�M 0 adate aDate� m    �L
�L 
TEXT� o      �K�K 
0 curday  � ��� r    ��� c    ��� n    ��� 1    �J
�J 
time� o    �I�I 0 adate aDate� m    �H
�H 
TEXT� o      �G�G 0 curtime  � ��� l     �F�E�D�F  �E  �D  � ��� Z     3���C�� I     '�B��A�B 0 folderexists  � ��� o   ! "�@�@ 0 curyear  � ��?� o   " #�>�> 0 curmonth  �?  �A  � r   * -��� m   * +�=
�= boovtrue� o      �<�< 0 monthexists  �C  � r   0 3��� m   0 1�;
�; boovfals� o      �:�: 0 monthexists  � ��� l  4 4�9�8�7�9  �8  �7  � ��� r   4 7��� m   4 5�� ��� $ * *   C h a n g e   m o n t h   * *� o      �6�6 0 changemonthmessage  � ��� r   8 ;��� m   8 9�� ��� " * *   C h a n g e   y e a r   * *� o      �5�5 0 changeyearmessage  � ��� r   < ?��� m   < =�4
�4 boovfals� o      �3�3 0 choosenproject  � ��� r   @ C   o   @ A�2�2 0 changemonthmessage   o      �1�1 0 pr  �  l  D D�0�/�.�0  �/  �.   �- O   D k   H 	 V   H	

 k   O  l  O O�,�,   / )if curmonth is not changeyearmessage then    � R i f   c u r m o n t h   i s   n o t   c h a n g e y e a r m e s s a g e   t h e n  Z   O ��+�* o   O P�)�) 0 monthexists   O   S � O   Z � k   a �  r   a d m   a b�(
�( boovtrue o      �'�' 0 choosenproject     r   e m!"! e   e k## n   e k$%$ 1   h j�&
�& 
pnam% 2   e h�%
�% 
rkpj" o      �$�$ 0 x    &'& r   n r()( o   n o�#�# 0 changemonthmessage  ) n      *+*  ;   p q+ o   o p�"�" 0 x  ' ,-, I  s z�!./
�! .gtqpchltns    @   @ ns  . o   s t� �  0 x  / �0�
� 
prmp0 m   u v11 �22   C h o o s e   a   p r o j e c t�  - 3�3 r   { �454 n   { �676 4   | ��8
� 
cobj8 m    ��� 7 1   { |�
� 
rslt5 o      �� 0 pr  �   4   Z ^�9
� 
rkfl9 o   \ ]�� 0 curmonth   4   S W�:
� 
rkfl: o   U V�� 0 curyear  �+  �*   ;<; Z   � �=>��= =  � �?@? o   � ��� 0 pr  @ o   � ��� 0 changemonthmessage  > k   � �AA BCB r   � �DED m   � ��
� boovfalsE o      �� 0 choosenproject  C F�F O   � �GHG k   � �II JKJ r   � �LML n   � �NON 1   � ��
� 
pnamO 2   � ��
� 
rkflM o      �� 0 x  K PQP r   � �RSR o   � ��
�
 0 changeyearmessage  S n      TUT  ;   � �U o   � ��	�	 0 x  Q VWV I  � ��XY
� .gtqpchltns    @   @ ns  X o   � ��� 0 x  Y �Z�
� 
prmpZ m   � �[[ �\\  c h o o s e   m o n t h�  W ]�] r   � �^_^ n   � �`a` 4   � ��b
� 
cobjb m   � ��� a 1   � ��
� 
rslt_ o      � �  0 curmonth  �  H 4   � ���c
�� 
rkflc o   � ����� 0 curyear  �  �  �  < d��d Z   �ef��ge =  � �hih o   � ����� 0 curmonth  i o   � ����� 0 changeyearmessage  f k   � �jj klk r   � �mnm 6 � �opo n   � �qrq 1   � ���
�� 
pnamr 2   � ���
�� 
rkflp F   � �sts H   � �uu E   � �vwv 1   � ���
�� 
pnamw m   � �xx �yy  -t C   � �z{z 1   � ���
�� 
pnam{ m   � �|| �}}  2n o      ���� 0 x  l ~~ l  � �������  � J D Lazy programming. Must get round to fixing it before the year 3000.   � ��� �   L a z y   p r o g r a m m i n g .   M u s t   g e t   r o u n d   t o   f i x i n g   i t   b e f o r e   t h e   y e a r   3 0 0 0 . ��� I  � �����
�� .gtqpchltns    @   @ ns  � o   � ����� 0 x  � �����
�� 
prmp� m   � ��� ���  c h o o s e   y e a r��  � ��� r   � ���� n   � ���� 4   � ����
�� 
cobj� m   � ����� � 1   � ���
�� 
rslt� o      ���� 0 curyear  � ���� r   � ���� m   � ���
�� boovfals� o      ���� 0 monthexists  ��  ��  g r  ��� m  ��
�� boovtrue� o      ���� 0 monthexists  ��   H   L N�� o   L M���� 0 choosenproject  	 ���� L  
�� o  
���� 0 pr  ��   m   D E���                                                                                  fstp  alis    P  
Subversion                 �1ubH+     OAperture.app                                                    
�p��        ����  	                Applications    �1�      �~�Z       O  %Subversion:Applications: Aperture.app     A p e r t u r e . a p p   
 S u b v e r s i o n  Applications/Aperture.app   / ��  �-  � ��� l     ��������  ��  ��  � ��� i    ��� I      ������� 0 
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
rkmr� m   v x���� ��  ��  �  ��  O   � � I  � �����
�� .corecrel****      � null��   ��
�� 
kocl m   � ���
�� 
rkip ����
�� 
prdt K   � � ��	
�� 
pnam m   � �

 �  U r g e n c y	 ����
�� 
rkvl m   � � �  6��  ��   l  � ����� 6 � � 2   � ���
�� 
rkdp =  � � 1   � ���
�� 
rkmr m   � ����� ��  ��  ��  � 4    ��
�� 
rkpj o    ���� 0 pr  � m     �                                                                                  fstp  alis    P  
Subversion                 �1ubH+     OAperture.app                                                    
�p��        ����  	                Applications    �1�      �~�Z       O  %Subversion:Applications: Aperture.app     A p e r t u r e . a p p   
 S u b v e r s i o n  Applications/Aperture.app   / ��  �  l     ��������  ��  ��    i     I      ������ 0 addlinks addLinks  1      ��
�� 
sele   o      ���� 0 	linkspath 	linksPath  !��! o      ���� 0 databasepath databasePath��  ��   k    "" #$# Z     %&����% H     '' n    ()( I    ��*���� 0 
fileexists 
fileExists* +��+ o    ���� 0 	linkspath 	linksPath��  ��  )  f     & k   
 ,, -.- r   
 /0/ b   
 121 m   
 33 �44  m k d i r  2 o    ���� 0 	linkspath 	linksPath0 o      ���� 0 	thescript  . 5��5 I   ��6�
�� .sysoexecTEXT���     TEXT6 o    �~�~ 0 	thescript  �  ��  ��  ��  $ 787 r    9:9 o    �}
�} 
ret : o      �|�| 0 theout theOut8 ;<; O   =>= X   "?�{@? k   2AA BCB r   2 7DED n   2 5FGF 1   3 5�z
�z 
rkrdG o   2 3�y�y 
0 curimg  E o      �x�x 0 isref isRefC HIH r   8 =JKJ n   8 ;LML 1   9 ;�w
�w 
ID  M o   8 9�v�v 
0 curimg  K o      �u�u 0 curid curIDI NON l  > >�t�s�r�t  �s  �r  O PQP r   > CRSR n   > ATUT 1   ? A�q
�q 
pnamU o   > ?�p�p 
0 curimg  S o      �o�o 0 curname  Q VWV r   D LXYX n   D JZ[Z 1   H J�n
�n 
rkvl[ n   D H\]\ 4   E H�m^
�m 
rkot^ m   F G__ �``  F i l e N a m e] o   D E�l�l 
0 curimg  Y o      �k�k 0 
mastername 
masterNameW aba l  M M�j�i�h�j  �i  �h  b cdc r   M Refe l  M Pg�g�fg b   M Phih l  M Nj�e�dj o   M N�c�c 0 curname  �e  �d  i m   N Okk �ll            -          �g  �f  f o      �b�b 0 newline newLined mnm l  S S�a�`�_�a  �`  �_  n opo Z   Sqr�^�]q =  S Vsts o   S T�\�\ 0 isref isReft m   T U�[
�[ boovtruer k   Yuu vwv r   Y nxyx b   Y lz{z b   Y h|}| b   Y f~~ b   Y b��� o   Y ^�Z�Z 	0 p_sql  � l  ^ a��Y�X� n   ^ a��� 1   _ a�W
�W 
strq� o   ^ _�V�V 0 databasepath databasePath�Y  �X   m   b e�� ��� ^   " s e l e c t   M A S T E R U U I D   f r o m   R K V E R S I O N   w h e r e   U U I D = '} o   f g�U�U 0 curid curID{ m   h k�� ���  ' "y o      �T�T 0 	thescript  w ��� r   o v��� I  o t�S��R
�S .sysoexecTEXT���     TEXT� o   o p�Q�Q 0 	thescript  �R  � o      �P�P 0 	zfileuuid 	ZFILEUUID� ��� l  w w�O�N�M�O  �N  �M  � ��� l  w w�L���L  � ' ! ---------- Get the master's path   � ��� B   - - - - - - - - - -   G e t   t h e   m a s t e r ' s   p a t h� ��� r   w ���� b   w ���� b   w ���� b   w ���� b   w ���� o   w |�K�K 	0 p_sql  � l  | ��J�I� n   | ��� 1   } �H
�H 
strq� o   | }�G�G 0 databasepath databasePath�J  �I  � m   � ��� ��� Z   " s e l e c t   I M A G E P A T H   f r o m   R K M A S T E R   w h e r e   U U I D = '� o   � ��F�F 0 	zfileuuid 	ZFILEUUID� m   � ��� ���  ' "� o      �E�E 0 	thescript  � ��� r   � ���� I  � ��D��C
�D .sysoexecTEXT���     TEXT� o   � ��B�B 0 	thescript  �C  � o      �A�A 0 
zimagepath 
ZIMAGEPATH� ��� l  � ��@�?�>�@  �?  �>  � ��� l  � ��=���=  � , & ---------- Get the master's disk name   � ��� L   - - - - - - - - - -   G e t   t h e   m a s t e r ' s   d i s k   n a m e� ��� r   � ���� b   � ���� b   � ���� b   � ���� b   � ���� o   � ��<�< 	0 p_sql  � l  � ���;�:� n   � ���� 1   � ��9
�9 
strq� o   � ��8�8 0 databasepath databasePath�;  �:  � m   � ��� ��� d   " s e l e c t   F I L E V O L U M E U U I D   f r o m   R K M A S T E R   w h e r e   U U I D = '� o   � ��7�7 0 	zfileuuid 	ZFILEUUID� m   � ��� ���  ' "� o      �6�6 0 	thescript  � ��� r   � ���� I  � ��5��4
�5 .sysoexecTEXT���     TEXT� o   � ��3�3 0 	thescript  �4  � o      �2�2 "0 zfilevolumeuuid ZFILEVOLUMEUUID� ��� r   � ���� b   � ���� b   � ���� b   � ���� b   � ���� o   � ��1�1 	0 p_sql  � l  � ���0�/� n   � ���� 1   � ��.
�. 
strq� o   � ��-�- 0 databasepath databasePath�0  �/  � m   � ��� ��� P   " s e l e c t   N A M E   f r o m   R K V O L U M E   w h e r e   U U I D = '� o   � ��,�, "0 zfilevolumeuuid ZFILEVOLUMEUUID� m   � ��� ���  ' "� o      �+�+ 0 	thescript  � ��� r   � ���� I  � ��*��)
�* .sysoexecTEXT���     TEXT� o   � ��(�( 0 	thescript  �)  � o      �'�' 0 diskname diskName� ��� l  � ��&�%�$�&  �%  �$  � ��� r   � ���� b   � ���� m   � ��� ���  /� o   � ��#�# 0 
zimagepath 
ZIMAGEPATH� o      �"�" 0 imgpath imgPath� ��� r   � ���� b   � ���� b   � ���� b   � ���� b   � ���� b   � ���� m   � ��� ���  l n   - s  � n   � ���� 1   � ��!
�! 
strq� o   � �� �  0 imgpath imgPath� m   � �   �   � o   � ��� 0 	linkspath 	linksPath� m   � � �  /� n   � � 1   � ��
� 
strq o   � ��� 0 
mastername 
masterName� o      �� 0 	thescript  � � Q   �� I  � ��	�
� .sysoexecTEXT���     TEXT	 o   � ��� 0 	thescript  �   R      ���
� .ascrerr ****      � ****�  �  �  �  �^  �]  p 

 l ����  �  �    r   b  
 o  �� 0 newline newLine o  	�� 0 	thescript   o      �� 0 newline newLine  r   b   b   o  �� 0 theout theOut o  �� 0 newline newLine o  �
� 
ret  o      �
�
 0 theout theOut �	 l ����  �  �  �	  �{ 
0 curimg  @ 1   % &�
� 
sele> m    �                                                                                  fstp  alis    P  
Subversion                 �1ubH+     OAperture.app                                                    
�p��        ����  	                Applications    �1�      �~�Z       O  %Subversion:Applications: Aperture.app     A p e r t u r e . a p p   
 S u b v e r s i o n  Applications/Aperture.app   / ��  < � L   o  �� 0 theout theOut�    l     ��� �  �  �     !  i    ""#" I      ��$���� 0 
exportpics 
exportPics$ %&% o      ���� 0 selectedpics selectedPics& '(' o      ���� 0 databasepath databasePath( )*) o      ���� 0 dpath dPath* +,+ o      ���� 0 tpath tPath, -��- o      ���� 0 wpath wPath��  ��  # k    �.. /0/ r     121 c     	343 n     565 1    ��
�� 
year6 l    7����7 I    ������
�� .misccurdldt    ��� null��  ��  ��  ��  4 m    ��
�� 
TEXT2 o      ���� 0 curyear  0 898 r    :;: c    <=< n    >?> m    ��
�� 
mnth? l   @����@ I   ������
�� .misccurdldt    ��� null��  ��  ��  ��  = m    ��
�� 
TEXT; o      ���� 0 curmonth  9 ABA r    #CDC c    !EFE n    GHG 1    ��
�� 
day H l   I����I I   ������
�� .misccurdldt    ��� null��  ��  ��  ��  F m     ��
�� 
TEXTD o      ���� 
0 curday  B JKJ r   $ /LML c   $ -NON n   $ +PQP 1   ) +��
�� 
timeQ l  $ )R����R I  $ )������
�� .misccurdldt    ��� null��  ��  ��  ��  O m   + ,��
�� 
TEXTM o      ���� 0 curtime  K STS l  0 0��������  ��  ��  T UVU r   0 ;WXW b   0 9YZY b   0 7[\[ b   0 5]^] b   0 3_`_ m   0 1aa �bb 
 / t m p /` o   1 2���� 0 curyear  ^ o   3 4���� 0 curmonth  \ o   5 6���� 
0 curday  Z o   7 8���� 0 curtime  X o      ���� 0 temppath tempPathV cdc r   < Aefe b   < ?ghg m   < =ii �jj  m k d i r  h o   = >���� 0 temppath tempPathf o      ���� 0 	thescript  d klk I  B G��m��
�� .sysoexecTEXT���     TEXTm o   B C���� 0 	thescript  ��  l non l  H H��������  ��  ��  o pqp Z   H grs����r H   H Ott n  H Nuvu I   I N��w���� 0 
fileexists 
fileExistsw x��x o   I J���� 0 dpath dPath��  ��  v  f   H Is k   R cyy z{z I  R W��|��
�� .ascrcmnt****      � ****| o   R S���� 0 dpath dPath��  { }~} r   X ]� b   X [��� m   X Y�� ���  m k d i r  � o   Y Z���� 0 dpath dPath� o      ���� 0 	thescript  ~ ���� I  ^ c�����
�� .sysoexecTEXT���     TEXT� o   ^ _���� 0 	thescript  ��  ��  ��  ��  q ��� l  h h��������  ��  ��  � ��� Z   h �������� H   h o�� n  h n��� I   i n������� 0 
fileexists 
fileExists� ���� o   i j���� 0 tpath tPath��  ��  �  f   h i� k   r }�� ��� r   r w��� b   r u��� m   r s�� ���  m k d i r  � o   s t���� 0 tpath tPath� o      ���� 0 	thescript  � ���� I  x }�����
�� .sysoexecTEXT���     TEXT� o   x y���� 0 	thescript  ��  ��  ��  ��  � ��� l  � ���������  ��  ��  � ��� Z   � �������� H   � ��� n  � ���� I   � �������� 0 
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
insh� o   � ��� 0 temppath tempPath��  � ��� r   ���� b   ���� b   ���� b   � ���� m   � ��� ���  m v  � o   � ��~�~ 0 temppath tempPath� m   ��� ���  / *  � o  �}�} 0 tpath tPath� o      �|�| 0 	thescript  � ��� I �{ �z
�{ .sysoexecTEXT���     TEXT  o  	�y�y 0 	thescript  �z  �  I /�x
�x .rkstrkxpnull���     **** o  �w�w 0 selectedpics selectedPics �v
�v 
nmfi 4  �u
�u 
rknp m   �		  V e r s i o n   N a m e �t

�t 
faal
 4  %�s
�s 
rkes m  !$ � R J P E G   -   F i t   w i t h i n   1 0 2 4   x   1 0 2 4   W a t e r m a r k e d �r�q
�r 
insh o  ()�p�p 0 temppath tempPath�q    r  0= b  0; b  09 b  05 m  03 �  m v   o  34�o�o 0 temppath tempPath m  58 �  / *   o  9:�n�n 0 wpath wPath o      �m�m 0 	thescript   �l I >C�k�j
�k .sysoexecTEXT���     TEXT o  >?�i�i 0 	thescript  �j  �l  � m   � ��h�h� m   � �  �                                                                                  fstp  alis    P  
Subversion                 �1ubH+     OAperture.app                                                    
�p��        ����  	                Applications    �1�      �~�Z       O  %Subversion:Applications: Aperture.app     A p e r t u r e . a p p   
 S u b v e r s i o n  Applications/Aperture.app   / ��  � !"! l FF�g�f�e�g  �f  �e  " #$# l FF�d%&�d  % K E**** Get rid of spaces and brackets in filenames (damn you apple)****   & �'' � * * * *   G e t   r i d   o f   s p a c e s   a n d   b r a c k e t s   i n   f i l e n a m e s   ( d a m n   y o u   a p p l e ) * * * *$ ()( r  FM*+* J  FK,, -.- o  FG�c�c 0 wpath wPath. /0/ o  GH�b�b 0 tpath tPath0 1�a1 o  HI�`�` 0 dpath dPath�a  + o      �_�_ 0 fixpaths  ) 232 X  N~4�^54 k  by66 787 r  bs9:9 b  bq;<; b  bm=>= b  bk?@? b  bgABA m  beCC �DD  f o r   f i l e   i n  B o  ef�]�] 0 fixpath  @ m  gjEE �FF � / * ;   d o   o l d = ` b a s e n a m e   " $ f i l e " ` ;   n e w = $ { o l d / / [   ) ] / } ;   n e w = $ { n e w / / [ ( ] / _ } ;   i f   [   - f   " $ f i l e "   ] ;   t h e n   m v   " $ f i l e "  > o  kl�\�\ 0 fixpath  < m  mpGG �HH  / $ n e w ;   f i ;   d o n e: o      �[�[ 0 	thescript  8 I�ZI I ty�YJ�X
�Y .sysoexecTEXT���     TEXTJ o  tu�W�W 0 	thescript  �X  �Z  �^ 0 fixpath  5 o  QR�V�V 0 fixpaths  3 KLK l �U�T�S�U  �T  �S  L MNM r  �OPO b  �QRQ m  �SS �TT  r m d i r  R o  ���R�R 0 temppath tempPathP o      �Q�Q 0 	thescript  N U�PU I ���OV�N
�O .sysoexecTEXT���     TEXTV o  ���M�M 0 	thescript  �N  �P  ! WXW l     �L�K�J�L  �K  �J  X YZY i   # &[\[ I      �I]�H�I 60 exporthandwatermarkedpics exportHandWatermarkedPics] ^_^ o      �G�G ,0 watermarkedselection watermarkedSelection_ `a` o      �F�F 0 databasepath databasePatha b�Eb o      �D�D 0 wpath wPath�E  �H  \ Z     Vcd�C�Bc l    e�A�@e ?    fgf l    h�?�>h I    �=i�<
�= .corecnte****       ****i o     �;�; ,0 watermarkedselection watermarkedSelection�<  �?  �>  g m    �:�:  �A  �@  d k   
 Rjj klk r   
 mnm b   
 opo b   
 qrq m   
 ss �tt  m k d i r   - p  r o    �9�9 0 wpath wPathp m    uu �vv  / t m pn o      �8�8 0 	thescript  l wxw I   �7y�6
�7 .sysoexecTEXT���     TEXTy o    �5�5 0 	thescript  �6  x z{z O    0|}| k    /~~ � l   �4���4  � S Mexport to a temporary directory because export won't overwrite existing files   � ��� � e x p o r t   t o   a   t e m p o r a r y   d i r e c t o r y   b e c a u s e   e x p o r t   w o n ' t   o v e r w r i t e   e x i s t i n g   f i l e s� ��3� I   /�2��
�2 .rkstrkxpnull���     ****� o    �1�1 ,0 watermarkedselection watermarkedSelection� �0��
�0 
nmfi� 4    "�/�
�/ 
rknp� m     !�� ���  V e r s i o n   N a m e� �.��
�. 
faal� 4   # '�-�
�- 
rkes� m   % &�� ��� ( J P E G   -   O r i g i n a l   S i z e� �,��+
�, 
insh� b   ( +��� o   ( )�*�* 0 wpath wPath� m   ) *�� ���  / t m p�+  �3  } m    ���                                                                                  fstp  alis    P  
Subversion                 �1ubH+     OAperture.app                                                    
�p��        ����  	                Applications    �1�      �~�Z       O  %Subversion:Applications: Aperture.app     A p e r t u r e . a p p   
 S u b v e r s i o n  Applications/Aperture.app   / ��  { ��� l  1 1�)���)  � ^ X Now move the exported file on top of the existing exports and delete the temp directory   � ��� �   N o w   m o v e   t h e   e x p o r t e d   f i l e   o n   t o p   o f   t h e   e x i s t i n g   e x p o r t s   a n d   d e l e t e   t h e   t e m p   d i r e c t o r y� ��� r   1 F��� b   1 D��� b   1 @��� b   1 >��� b   1 :��� b   1 8��� b   1 4��� m   1 2�� ���  m v   - f  � o   2 3�(�( 0 wpath wPath� m   4 7�� ���  / t m p / *  � o   8 9�'�' 0 wpath wPath� m   : =�� ���  ;   r m   - r  � o   > ?�&�& 0 wpath wPath� m   @ C�� ���  / t m p� o      �%�% 0 	thescript  � ��� l  G G�$���$  � ; 5set thescript to "cp -f " & wPath & "/tmp/* " & wPath   � ��� j s e t   t h e s c r i p t   t o   " c p   - f   "   &   w P a t h   &   " / t m p / *   "   &   w P a t h� ��� I  G L�#��"
�# .sysoexecTEXT���     TEXT� o   G H�!�! 0 	thescript  �"  � �� � I  M R���
� .ascrcmnt****      � ****� o   M N�� 0 	thescript  �  �   �C  �B  Z ��� l     ����  �  �  � ��� i   ' *��� I      ���� 0 
getlibpath 
getLibPath�  �  � k     \�� ��� O    ��� r    ��� n    ��� 1    �
� 
valL� n    ��� 4    ��
� 
plii� m    �� ���  L i b r a r y P a t h� 4    ��
� 
plif� l   ���� b    ��� l   ���� I   ���
� .earsffdralis        afdr� m    �
� afdrpref� ���
� 
rtyp� m    	�

�
 
utxt�  �  �  � m    �� ��� 0 c o m . a p p l e . A p e r t u r e . p l i s t�  �  � o      �	�	 0 	p_libpath 	p_libPath� m     ���                                                                                  sevs  alis    �  
Subversion                 �1ubH+     2System Events.app                                               0��a9        ����  	                CoreServices    �1�      ���       2   ,   +  ;Subversion:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p   
 S u b v e r s i o n  -System/Library/CoreServices/System Events.app   / ��  � ��� l   ����  �  �  � ��� Z    \����� l   $���� >   $��� l   "��� � I   "�����
�� .sysooffslong    ��� null��  � ����
�� 
psof� m    �� ���  ~� �����
�� 
psin� o    ���� 0 	p_libpath 	p_libPath��  �  �   � m   " #����  �  �  � k   ' W�� ��� r   ' *��� m   ' (�� ���  / b i n / e c h o   $ H O M E� o      ���� 0 p_script  � ��� r   + 2��� l  + 0������ I  + 0�����
�� .sysoexecTEXT���     TEXT� o   + ,���� 0 p_script  ��  ��  ��  � o      ���� 0 
p_homepath 
p_homePath� ��� l  3 3��������  ��  ��  � ��� r   3 @��� I  3 >�����
�� .sysooffslong    ��� null��  � �� 
�� 
psof  m   5 8 �  ~ ����
�� 
psin o   9 :���� 0 	p_libpath 	p_libPath��  � o      ���� 0 p_offset  �  r   A R n   A P	
	 7  B P��
�� 
ctxt l  H L���� [   H L o   I J���� 0 p_offset   m   J K���� ��  ��   m   M O������
 o   A B���� 0 	p_libpath 	p_libPath o      ���� 
0 p_path    l  S S��������  ��  ��   �� L   S W b   S V o   S T���� 0 
p_homepath 
p_homePath o   T U���� 
0 p_path  ��  �  � L   Z \ o   Z [���� 0 	p_libpath 	p_libPath�  �  A ��F !��   ������������������������ 	0 p_sql  �� 0 
fileexists 
fileExists�� 0 folderexists  �� 0 monthtointeger  �� 0 monthtostring  �� 0 chooseproject chooseProject�� 0 
seturgency 
setUrgency�� 0 addlinks addLinks�� 0 
exportpics 
exportPics�� 60 exporthandwatermarkedpics exportHandWatermarkedPics�� 0 
getlibpath 
getLibPath ��M����"#���� 0 
fileexists 
fileExists�� ��$�� $  ���� 0 	posixpath 	posixPath��  " ���� 0 	posixpath 	posixPath# \��`������
�� 
strq
�� .sysoexecTEXT���     TEXT
�� 
long
�� 
bool�� ��,%�%j �&�& ��g����%&���� 0 folderexists  �� ��'�� '  ������ 0 
folderyear  �� 0 foldermonth  ��  % ������ 0 
folderyear  �� 0 foldermonth  & �����
�� 
rkfl
�� .coredoexnull���     ****�� 2� .*�/j  *�/ *�/j  eY fUY hOfU �������()���� 0 monthtointeger  �� ��*�� *  ���� 0 monthstring  ��  ( ���� 0 monthstring  ) ��������
�� 
ldt 
�� 
mnth
�� 
long�� *��%�%/�,�& �������+,���� 0 monthtostring  �� ��-�� -  ���� 0 monthint  ��  + ���� 0 monthint  , ��������
�� 
ldt 
�� 
mnth
�� 
TEXT�� *��%�%/�,�& �������./���� 0 chooseproject chooseProject�� ��0�� 0  ���� 0 adate aDate��  . ������������������������ 0 adate aDate�� 0 curyear  �� 0 curmonth  �� 
0 curday  �� 0 curtime  �� 0 monthexists  �� 0 changemonthmessage  �� 0 changeyearmessage  �� 0 choosenproject  �� 0 pr  �� 0 x  / �����������������������1������[1x|�
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
cobj1  ����,�&E�O��,�&E�O��,�&E�O��,�&E�O*��l+  eE�Y fE�O�E�O�E�OfE�O�E�O� � �h�� 7*�/ ,*�/ $eE�O*�-�,EE�O��6FO���l O�a k/E�UUY hO��  0fE�O*�/ !*�-�,E�O��6FO��a l O�a k/E�UY hO��  =*�-�,a [[�,\Za @C\[�,\Za >A1E�O��a l O�a k/E�OfE�Y eE�[OY�EO�U �������23���� 0 
seturgency 
setUrgency�� ��4�� 4  �� 0 pr  ��  2 �~�~ 0 pr  3 �}�|1�{�z�y�x�w�v��u��t�s������

�} 
rkpj
�| 
rkdp
�{ 
rkmr�z 
�y 
kocl
�x 
rkip
�w 
prdt
�v 
pnam
�u 
rkvl�t 
�s .corecrel****      � null�� �� �*�/ �*�-�[�,\Z�81 *��������� UO*�-�[�,\Z�81 *������a �� UO*�-�[�,\Zm81 *����a �a �� UO*�-�[�,\Zl81 *����a �a �� UO*�-�[�,\Zk81 *����a �a �� UUU �r�q�p56�o�r 0 addlinks addLinks�q �n7�n 7  �m�l�k
�m 
sele�l 0 	linkspath 	linksPath�k 0 databasepath databasePath�p  5 �j�i�h�g�f�e�d�c�b�a�`�_�^�]�\�[
�j 
sele�i 0 	linkspath 	linksPath�h 0 databasepath databasePath�g 0 	thescript  �f 0 theout theOut�e 
0 curimg  �d 0 isref isRef�c 0 curid curID�b 0 curname  �a 0 
mastername 
masterName�` 0 newline newLine�_ 0 	zfileuuid 	ZFILEUUID�^ 0 
zimagepath 
ZIMAGEPATH�] "0 zfilevolumeuuid ZFILEVOLUMEUUID�\ 0 diskname diskName�[ 0 imgpath imgPath6 �Z3�Y�X�W�V�U�T�S�R�Q_�Pk�O���������� �N�M�Z 0 
fileexists 
fileExists
�Y .sysoexecTEXT���     TEXT
�X 
ret 
�W 
kocl
�V 
cobj
�U .corecnte****       ****
�T 
rkrd
�S 
ID  
�R 
pnam
�Q 
rkot
�P 
rkvl
�O 
strq�N  �M  �o )�k+   �%E�O�j Y hO�E�O� � ��[��l kh ��,E�O��,E�O��,E�O���/�,E�O��%E�O�e  �b   ��,%a %�%a %E�O�j E�Ob   ��,%a %�%a %E�O�j E�Ob   ��,%a %�%a %E�O�j E�Ob   ��,%a %�%a %E�O�j E�Oa �%E�Oa ��,%a %�%a %��,%E�O 
�j W X  hY hO��%E�O��%�%E�OP[OY�UO� �L#�K�J89�I�L 0 
exportpics 
exportPics�K �H:�H :  �G�F�E�D�C�G 0 selectedpics selectedPics�F 0 databasepath databasePath�E 0 dpath dPath�D 0 tpath tPath�C 0 wpath wPath�J  8 �B�A�@�?�>�=�<�;�:�9�8�7�6�B 0 selectedpics selectedPics�A 0 databasepath databasePath�@ 0 dpath dPath�? 0 tpath tPath�> 0 wpath wPath�= 0 curyear  �< 0 curmonth  �; 
0 curday  �: 0 curtime  �9 0 temppath tempPath�8 0 	thescript  �7 0 fixpaths  �6 0 fixpath  9 *�5�4�3�2�1�0ai�/�.�-��� �,�+�*��)�(��'�&�%�������$�#�"CEGS
�5 .misccurdldt    ��� null
�4 
year
�3 
TEXT
�2 
mnth
�1 
day 
�0 
time
�/ .sysoexecTEXT���     TEXT�. 0 
fileexists 
fileExists
�- .ascrcmnt****      � ****�,
�+ 
nmfi
�* 
rknp
�) 
faal
�( 
rkes
�' 
insh�& 
�% .rkstrkxpnull���     ****
�$ 
kocl
�# 
cobj
�" .corecnte****       ****�I�*j  �,�&E�O*j  �,�&E�O*j  �,�&E�O*j  �,�&E�O�%�%�%�%E�O�%E�O�j O)�k+ 	 �j 
O�%E�O�j Y hO)�k+ 	 �%E�O�j Y hO)�k+ 	 ��%E�O�j Y hO� ��n�a *a a /a *a a /a �a  Oa �%a %�%E�O�j O�a *a a /a *a a /a �a  Oa �%a %�%E�O�j O�a *a a /a *a a  /a �a  Oa !�%a "%�%E�O�j oUO���mvE�O /�[a #a $l %kh a &�%a '%�%a (%E�O�j [OY��Oa )�%E�O�j   �!\� �;<��! 60 exporthandwatermarkedpics exportHandWatermarkedPics�  �=� =  ���� ,0 watermarkedselection watermarkedSelection� 0 databasepath databasePath� 0 wpath wPath�  ; ����� ,0 watermarkedselection watermarkedSelection� 0 databasepath databasePath� 0 wpath wPath� 0 	thescript  < �su�����������������
� .corecnte****       ****
� .sysoexecTEXT���     TEXT
� 
nmfi
� 
rknp
� 
faal
� 
rkes
� 
insh� 
� .rkstrkxpnull���     ****
� .ascrcmnt****      � ****� W�j  j M�%�%E�O�j O� ��*��/�*��/��%� UO�%a %�%a %�%a %E�O�j O�j Y h! ���
�	>?�� 0 
getlibpath 
getLibPath�
  �	  > ������ 0 	p_libpath 	p_libPath� 0 p_script  � 0 
p_homepath 
p_homePath� 0 p_offset  � 
0 p_path  ? ���� ������������������������
� 
plif
� afdrpref
�  
rtyp
�� 
utxt
�� .earsffdralis        afdr
�� 
plii
�� 
valL
�� 
psof
�� 
psin�� 
�� .sysooffslong    ��� null
�� .sysoexecTEXT���     TEXT
�� 
ctxt� ]� *����l �%/��/�,E�UO*���� j 5�E�O�j E�O*�a �� E�O�[a \[Z�k\Zi2E�O��%Y � �@@ ^ / U s e r s / i a i n / P i c t u r e s / A p e r t u r e   L i b r a r y . a p l i b r a r y �AA  
� boovfals �BB ^ / U s e r s / i a i n / P i c t u r e s / A p e r t u r e   L i b r a r y . a p l i b r a r y �CC � / U s e r s / i a i n / P i c t u r e s / A p e r t u r e   L i b r a r y . a p l i b r a r y / D a t a b a s e / L i b r a r y . a p d b �DD  2 3 �EE 
 4 1 5 9 6
� boovtrue
� boovtrue	 �FF , 1 6 - P r e g n a n t - C u t t l e f i s h
 ��G�� G  HIJKLM �������������������������������H �NN  0 6 - r e t u r nI �OO  0 9 - t e s t - p r o j e c tJ �PP   1 3 - L e a k y - I k e l i t eK �QQ  1 5 - B i g - V i zL �RR , 1 6 - P r e g n a n t - C u t t l e f i s hM �SS , 2 2 - M a n t i s - a n d - F r o g f i s h��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��   �TT  0 5 �UU < 2 0 1 3 / 0 5 / 1 6 - P r e g n a n t - C u t t l e f i s h �VV � / U s e r s / i a i n / P i c t u r e s / P u b l i s h e d / f u l l s i z e / 2 0 1 3 / 0 5 / 1 6 - P r e g n a n t - C u t t l e f i s h �WW � / U s e r s / i a i n / P i c t u r e s / P u b l i s h e d / m a s t e r s / 2 0 1 3 / 0 5 / 1 6 - P r e g n a n t - C u t t l e f i s h �XX � / U s e r s / i a i n / P i c t u r e s / P u b l i s h e d / t h u m b s / 2 0 1 3 / 0 5 / 1 6 - P r e g n a n t - C u t t l e f i s h �YY � / U s e r s / i a i n / P i c t u r e s / P u b l i s h e d / w a t e r m a r k e d / 2 0 1 3 / 0 5 / 1 6 - P r e g n a n t - C u t t l e f i s h �ZZ � e c h o   " " >   / U s e r s / i a i n / P i c t u r e s / P u b l i s h e d / f u l l s i z e / 2 0 1 3 / 0 5 / 1 6 - P r e g n a n t - C u t t l e f i s h / n o t e s . t x t �[[   ��\�� \  ]^_`abcdefghijklmnopqrstuvwxyz] {{ |��}��| d��~��
�� 
rkpj~ � , h N i j j E % I R B W U N Q U C 3 e l V 6 g
�� kfrmID  
�� 
rkdp} ��� , l o q f P t G P T x G p C I W q u 1 b a b Q
�� kfrmID  ^ �� ������� d�����
�� 
rkpj� ��� , h N i j j E % I R B W U N Q U C 3 e l V 6 g
�� kfrmID  
�� 
rkdp� ��� , u P f 3 H h M E Q L i x b V C F Z K d 2 + Q
�� kfrmID  _ �� ������� d�����
�� 
rkpj� ��� , h N i j j E % I R B W U N Q U C 3 e l V 6 g
�� kfrmID  
�� 
rkdp� ��� , + 6 % Q m o r 1 S 2 y 7 J M v K 0 O 7 0 h g
�� kfrmID  ` �� ������� d�����
�� 
rkpj� ��� , h N i j j E % I R B W U N Q U C 3 e l V 6 g
�� kfrmID  
�� 
rkdp� ��� , Q b g y v 2 I Y T t 2 A X Y L J 1 W J H t g
�� kfrmID  a �� ������� d�����
�� 
rkpj� ��� , h N i j j E % I R B W U N Q U C 3 e l V 6 g
�� kfrmID  
�� 
rkdp� ��� , M n 1 J Z u Z J Q Q W e Q r U t + 0 F o C Q
�� kfrmID  b �� ������� d�����
�� 
rkpj� ��� , h N i j j E % I R B W U N Q U C 3 e l V 6 g
�� kfrmID  
�� 
rkdp� ��� , b x J v g 9 Q p R l S 9 5 1 E Z 4 g I o O A
�� kfrmID  c �� ������� d�����
�� 
rkpj� ��� , h N i j j E % I R B W U N Q U C 3 e l V 6 g
�� kfrmID  
�� 
rkdp� ��� , T o d m Y i R G R y S a c P V x Y P I y O g
�� kfrmID  d �� ������� d�����
�� 
rkpj� ��� , h N i j j E % I R B W U N Q U C 3 e l V 6 g
�� kfrmID  
�� 
rkdp� ��� , H 0 e d h g 3 T Q l y O g e V + q i G D r Q
�� kfrmID  e �� ������� d�����
�� 
rkpj� ��� , h N i j j E % I R B W U N Q U C 3 e l V 6 g
�� kfrmID  
�� 
rkdp� ��� , % o V Q u h M s T D y T h z o T t + C L A A
�� kfrmID  f �� ������� d�����
�� 
rkpj� ��� , h N i j j E % I R B W U N Q U C 3 e l V 6 g
�� kfrmID  
�� 
rkdp� ��� , G Y g E 9 f k w Q D y g x 0 z n O t 6 b m g
�� kfrmID  g �� ������� d�����
�� 
rkpj� ��� , h N i j j E % I R B W U N Q U C 3 e l V 6 g
�� kfrmID  
�� 
rkdp� ��� , s R I N 3 G k P T v G S I + z g G G K C a w
�� kfrmID  h �� ������� d�����
�� 
rkpj� ��� , h N i j j E % I R B W U N Q U C 3 e l V 6 g
�� kfrmID  
�� 
rkdp� ��� , k F C C L L J M S J W B p l f F u A K Y 1 w
�� kfrmID  i �� ������� d�����
�� 
rkpj� ��� , h N i j j E % I R B W U N Q U C 3 e l V 6 g
�� kfrmID  
�� 
rkdp� ��� , B 9 z 0 n s K Q S n e e l i T I q X O F e A
�� kfrmID  j �� ������� d�����
�� 
rkpj� ��� , h N i j j E % I R B W U N Q U C 3 e l V 6 g
�� kfrmID  
�� 
rkdp� ��� , u D G 3 y V V 5 Q F G U z D A n h 0 w w 2 w
�� kfrmID  k �� ������� d�����
�� 
rkpj� ��� , h N i j j E % I R B W U N Q U C 3 e l V 6 g
�� kfrmID  
�� 
rkdp� ��� , 3 v C h X N F m T B m y S l R v A 5 s v i A
�� kfrmID  l �� ������� d�����
�� 
rkpj� ��� , h N i j j E % I R B W U N Q U C 3 e l V 6 g
�� kfrmID  
�� 
rkdp� ��� , B A s P 5 Q + n T p 6 g 8 l S V t v Y U v w
�� kfrmID  m �� ������� d�����
�� 
rkpj� ��� , h N i j j E % I R B W U N Q U C 3 e l V 6 g
�� kfrmID  
�� 
rkdp� ��� , z m v D D % z W S Q 6 J y 6 V U a J R s H A
�� kfrmID  n �� ������� d�����
�� 
rkpj� ��� , h N i j j E % I R B W U N Q U C 3 e l V 6 g
�� kfrmID  
�� 
rkdp� ��� , W Y s y O W r 7 T 3 G a i V 0 g b 1 J T 0 w
�� kfrmID  o �� ������� d�����
�� 
rkpj� ��� , h N i j j E % I R B W U N Q U C 3 e l V 6 g
�� kfrmID  
�� 
rkdp� ��� , u O R 1 U p e n T H C c R % Y n n F a w o w
�� kfrmID  p �� ������� d�����
�� 
rkpj� ��� , h N i j j E % I R B W U N Q U C 3 e l V 6 g
�� kfrmID  
�� 
rkdp� ��� , F A p W N O X G Q A K P % Z A 6 Y 6 r N 2 A
�� kfrmID  q �� ������� d�����
�� 
rkpj� ��� , h N i j j E % I R B W U N Q U C 3 e l V 6 g
�� kfrmID  
�� 
rkdp� ��� , b X d g w f q V R c y b k Y 0 X y a C N 1 g
�� kfrmID  r �� ������� d�����
�� 
rkpj� ��� , h N i j j E % I R B W U N Q U C 3 e l V 6 g
�� kfrmID  
�� 
rkdp� ��� , D i k e i r 7 t Q v a q 8 V E A y r S J N Q
�� kfrmID  s �� 	 ��	��	  d��	��
�� 
rkpj	 �		 , h N i j j E % I R B W U N Q U C 3 e l V 6 g
�� kfrmID  
�� 
rkdp	 �		 , w Q u 8 Q h 1 M T z K 5 X S r R n w P g 2 Q
�� kfrmID  t 		 	��	��	 d��	��
�� 
rkpj	 �				 , h N i j j E % I R B W U N Q U C 3 e l V 6 g
�� kfrmID  
�� 
rkdp	 �	
	
 , 1 P R k T G v W Q t K E D b 6 3 2 j z % x Q
�� kfrmID  u 		 	��	��	 d��	��
�� 
rkpj	 �		 , h N i j j E % I R B W U N Q U C 3 e l V 6 g
�� kfrmID  
�� 
rkdp	 �		 , L 6 P Q O b E F T U + C X w 4 o 0 y E 7 J w
�� kfrmID  v 		 	��	�	 d�~	�}
�~ 
rkpj	 �		 , h N i j j E % I R B W U N Q U C 3 e l V 6 g
�} kfrmID  
�� 
rkdp	 �		 , 4 4 I d z o v v S f S n 2 k q l R W R e X w
� kfrmID  w 		 	�|	�{	 d�z	�y
�z 
rkpj	 �		 , h N i j j E % I R B W U N Q U C 3 e l V 6 g
�y kfrmID  
�| 
rkdp	 �		 , q j w H r 9 F Q S G C g H J 5 d m Z n 7 i w
�{ kfrmID  x 		 	�x	�w	 d�v	 �u
�v 
rkpj	  �	!	! , h N i j j E % I R B W U N Q U C 3 e l V 6 g
�u kfrmID  
�x 
rkdp	 �	"	" , L T C R z c C 9 S X O w m 5 G S g h N d D w
�w kfrmID  y 	#	# 	$�t	%�s	$ d�r	&�q
�r 
rkpj	& �	'	' , h N i j j E % I R B W U N Q U C 3 e l V 6 g
�q kfrmID  
�t 
rkdp	% �	(	( , h n C z 0 m 7 E Q o y b v v K X E I 2 1 x g
�s kfrmID  z 	)	) 	*�p	+�o	* d�n	,�m
�n 
rkpj	, �	-	- , h N i j j E % I R B W U N Q U C 3 e l V 6 g
�m kfrmID  
�p 
rkdp	+ �	.	. , R J 2 E d d J K S R S E U n t a c g 0 5 Z g
�o kfrmID   �l	/�l 	/  	0	1	2	3	4	5	6	7	8	9	:	;	<	=	0 	>	> 	?�k	@�j	? d�i	A�h
�i 
rkpj	A �	B	B , h N i j j E % I R B W U N Q U C 3 e l V 6 g
�h kfrmID  
�k 
rkdp	@ �	C	C , u m m d 3 I 5 j Q a O Y p A o 1 b W h N M w
�j kfrmID  	1 	D	D 	E�g	F�f	E d�e	G�d
�e 
rkpj	G �	H	H , h N i j j E % I R B W U N Q U C 3 e l V 6 g
�d kfrmID  
�g 
rkdp	F �	I	I , % z m V M n j S T M e t f o i + 2 V 8 d m g
�f kfrmID  	2 	J	J 	K�c	L�b	K d�a	M�`
�a 
rkpj	M �	N	N , h N i j j E % I R B W U N Q U C 3 e l V 6 g
�` kfrmID  
�c 
rkdp	L �	O	O , L u n 3 x E X C S r 2 2 c E 6 v l R 6 S T A
�b kfrmID  	3 	P	P 	Q�_	R�^	Q d�]	S�\
�] 
rkpj	S �	T	T , h N i j j E % I R B W U N Q U C 3 e l V 6 g
�\ kfrmID  
�_ 
rkdp	R �	U	U , m G 2 5 C 1 s p R 9 S h l t g 9 L r i 4 q Q
�^ kfrmID  	4 	V	V 	W�[	X�Z	W d�Y	Y�X
�Y 
rkpj	Y �	Z	Z , h N i j j E % I R B W U N Q U C 3 e l V 6 g
�X kfrmID  
�[ 
rkdp	X �	[	[ , u y Q B d R j 3 Q f u u 2 7 n E W z W C Y A
�Z kfrmID  	5 	\	\ 	]�W	^�V	] d�U	_�T
�U 
rkpj	_ �	`	` , h N i j j E % I R B W U N Q U C 3 e l V 6 g
�T kfrmID  
�W 
rkdp	^ �	a	a , P y l d X L 4 k R Y + H 2 N V a % % u G g w
�V kfrmID  	6 	b	b 	c�S	d�R	c d�Q	e�P
�Q 
rkpj	e �	f	f , h N i j j E % I R B W U N Q U C 3 e l V 6 g
�P kfrmID  
�S 
rkdp	d �	g	g , W p n v % 9 7 q S H y M 5 0 T R F l B p Q A
�R kfrmID  	7 	h	h 	i�O	j�N	i d�M	k�L
�M 
rkpj	k �	l	l , h N i j j E % I R B W U N Q U C 3 e l V 6 g
�L kfrmID  
�O 
rkdp	j �	m	m , + 7 O M n Z P U S n C v H A p M H N M q C Q
�N kfrmID  	8 	n	n 	o�K	p�J	o d�I	q�H
�I 
rkpj	q �	r	r , h N i j j E % I R B W U N Q U C 3 e l V 6 g
�H kfrmID  
�K 
rkdp	p �	s	s , l Y X T X L I y S S u 6 7 i w C p J r + E g
�J kfrmID  	9 	t	t 	u�G	v�F	u d�E	w�D
�E 
rkpj	w �	x	x , h N i j j E % I R B W U N Q U C 3 e l V 6 g
�D kfrmID  
�G 
rkdp	v �	y	y , t n 4 h 2 G i p T G O 0 G b 1 Y w U T b 6 Q
�F kfrmID  	: 	z	z 	{�C	|�B	{ d�A	}�@
�A 
rkpj	} �	~	~ , h N i j j E % I R B W U N Q U C 3 e l V 6 g
�@ kfrmID  
�C 
rkdp	| �		 , P N P D Q r k K T M G f A B 4 C v 3 R 7 7 A
�B kfrmID  	; 	�	� 	��?	��>	� d�=	��<
�= 
rkpj	� �	�	� , h N i j j E % I R B W U N Q U C 3 e l V 6 g
�< kfrmID  
�? 
rkdp	� �	�	� , 4 e U % L a d s Q s a N s U m S b E c 6 1 Q
�> kfrmID  	< 	�	� 	��;	��:	� d�9	��8
�9 
rkpj	� �	�	� , h N i j j E % I R B W U N Q U C 3 e l V 6 g
�8 kfrmID  
�; 
rkdp	� �	�	� , q + u v R n J I R W u D f q A W a W O x R w
�: kfrmID  	= 	�	� 	��7	��6	� d�5	��4
�5 
rkpj	� �	�	� , h N i j j E % I R B W U N Q U C 3 e l V 6 g
�4 kfrmID  
�7 
rkdp	� �	�	� , W A d 4 Y 5 O q T V y O w J N C F e r a % A
�6 kfrmID  �  �   ascr  ��ޭ