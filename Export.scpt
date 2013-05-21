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
libDBPOSIX�!  �$  � o  ���� *0 loadedexportlibrary loadedExportLibrary�'  �&  � ��� l     ����  �  �  � ��� l     ����  �  �  �       �� I��  � ��� 	0 p_sql  
� .aevtoappnull  �   � ****� ���� �
� .aevtoappnull  �   � ****� k    �       1  @  S  Z  a		  f

  m  }  �  �  �  �  �  �  �  � g r � � � � � �  1 I a   ~!! �"" �## �$$ �%% �&& ���  �  �      d������
�	��� >������ �������� w�� ��������������� ��� �������d���������� �������('EIU������������������������������������������������������+C[s���������������
� .misccurdldt    ��� null
� 
year
� 
TEXT� 0 curyear  
� 
mnth�
 0 curmonth  
�	 
alis
� afdrscr�
� 
rtyp
� .earsffdralis        afdr� 0 librarypath libraryPath
� .sysoloadscpt        file� *0 loadedexportlibrary loadedExportLibrary� 0 
getlibpath 
getLibPath� 0 	g_libpath 	g_libPath
�  
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
cobj'  �� 0 monthtointeger  �� 0 monthint  
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
exportPics�� 60 exporthandwatermarkedpics exportHandWatermarkedPics�� 0 addlinks addLinks��*j  �,�&E�O*j  �,�&E�O*����l 	�%/E�O�j E�O�j+ E�O_ E` OfE` O�a ,E` O_ a %�&E` Oa E` O*j  a ,�&E` O*j  a ,�&E` O���l+  
eE` Y fE` Oa E`  Oa !E` "OfE` #O_  E` $Oa %h_ #_  Q*a &�/ D*a &�/ :eE` #O*a '-a (,EE` )O_  _ )6FO_ )a *a +l ,O_ -a .k/E` $UUY hO_ $_    DfE` #O*a &�/ 1*a &-a (,E` )O_ "_ )6FO_ )a *a /l ,O_ -a .k/E�UY hO�_ "  O*a &-a (,a 0[[a (,\Za 1@C\[a (,\Za 2>A1E` )O_ )a *a 3l ,O_ -a .k/E�OfE` Y eE` [OY��UO��k+ 4�&E` 5O_ 5a 6,k  a 7_ 5%E` 5Y hO�a 8%_ 5%a 9%_ $%E` :O_ a ;%_ :%E` <O_ a =%_ :%E` >O_ a ?%_ :%E` @O_ a A%_ :%E` BOa % �*a '_ $/ �b   _ a C,%a D%*a E,%a F%E` GO_ Gj HE` IO*a J-a 0[[a K,\Zm:\[a L,\Za M8B1a N&E` OO*a J-a 0[a P-a (,\Za Q@1a N&E` RO�_ $k+ SUUO�_ <a ,k+ T a U_ <%E` GO_ Gj HY hO�_ @a ,k+ T a V_ @%E` GO_ Gj HY hO�_ >a ,k+ T a W_ >%E` GO_ Gj HY hO�_ Ba ,k+ T a X_ B%E` GO_ Gj HY hOa Y_ @%a Z%_ B%a [%_ >%a \%_ <%E` GO_ Gj HOa ]_ I%a ^%_ <%a _%E` GO_ Gj HO�_ O_ _ <_ @_ Ba `+ aO�_ R_ _ Bm+ bO�_ O_ >_ m+ cascr  ��ޭ