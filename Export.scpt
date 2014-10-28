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
TEXT $ o      ���� 0 curmonth  ��  ��   !  * + * l     �� , -��   ,  set curmonth to "August"    - � . . 0 s e t   c u r m o n t h   t o   " A u g u s t " +  / 0 / l     ��������  ��  ��   0  1 2 1 l   & 3���� 3 r    & 4 5 4 4    $�� 6
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
�j boovfals � o      �i�i 0 choosenproject  �l  �k   �  � � � l  � � ��h�g � r   � � � � � o   � ��f�f 0 changemonthmessage   � o      �e�e 0 pr  �h  �g   �  � � � l     �d�c�b�d  �c  �b   �  � � � l  �� ��a�` � O   �� � � � V   �� � � � k   �� � �  � � � l  � ��_ � ��_   � / )if curmonth is not changeyearmessage then    � � � � R i f   c u r m o n t h   i s   n o t   c h a n g e y e a r m e s s a g e   t h e n �  � � � Z   �( � ��^�] � o   � ��\�\ 0 monthexists   � O   �$ � � � O   �# � � � k   �" � �  � � � r   � � � � � m   � ��[
�[ boovtrue � o      �Z�Z 0 choosenproject   �  � � � r   � � � � � e   � � � � n   � � � � � 1   � ��Y
�Y 
pnam � 2   � ��X
�X 
rkpj � o      �W�W 0 x   �  � � � r   � � � � � o   � ��V�V 0 changemonthmessage   � n       � � �  ;   � � � o   � ��U�U 0 x   �  � � � I  �T � �
�T .gtqpchltns    @   @ ns   � o   �S�S 0 x   � �R ��Q
�R 
prmp � m  	 � � � � �   C h o o s e   a   p r o j e c t�Q   �    r   n   4  �P
�P 
cobj m  �O�O  1  �N
�N 
rslt o      �M�M 0 pr   �L I "�K�J
�K .ascrcmnt****      � **** o  �I�I 0 pr  �J  �L   � 4   � ��H	
�H 
rkfl	 o   � ��G�G 0 curmonth   � 4   � ��F

�F 
rkfl
 o   � ��E�E 0 curyear  �^  �]   �  Z  )v�D�C = )0 o  ),�B�B 0 pr   o  ,/�A�A 0 changemonthmessage   k  3r  r  38 m  34�@
�@ boovfals o      �?�? 0 choosenproject   �> O  9r k  Bq  r  BO n  BK 1  GK�=
�= 
pnam 2  BG�<
�< 
rkfl o      �;�; 0 x    !  r  PX"#" o  PS�:�: 0 changeyearmessage  # n      $%$  ;  VW% o  SV�9�9 0 x  ! &'& I Yf�8()
�8 .gtqpchltns    @   @ ns  ( o  Y\�7�7 0 x  ) �6*�5
�6 
prmp* m  _b++ �,,  c h o o s e   m o n t h�5  ' -�4- r  gq./. n  go010 4  jo�32
�3 
cobj2 m  mn�2�2 1 1  gj�1
�1 
rslt/ o      �0�0 0 curmonth  �4   4  9?�/3
�/ 
rkfl3 o  =>�.�. 0 curyear  �>  �D  �C   4�-4 Z  w�56�,75 = w|898 o  wx�+�+ 0 curmonth  9 o  x{�*�* 0 changeyearmessage  6 k  �:: ;<; r  �=>= 6�?@? n  �ABA 1  ���)
�) 
pnamB 2  ��(
�( 
rkfl@ F  ��CDC H  ��EE E  ��FGF 1  ���'
�' 
pnamG m  ��HH �II  -D C  ��JKJ 1  ���&
�& 
pnamK m  ��LL �MM  2> o      �%�% 0 x  < NON l ���$PQ�$  P J D Lazy programming. Must get round to fixing it before the year 3000.   Q �RR �   L a z y   p r o g r a m m i n g .   M u s t   g e t   r o u n d   t o   f i x i n g   i t   b e f o r e   t h e   y e a r   3 0 0 0 .O STS I ���#UV
�# .gtqpchltns    @   @ ns  U o  ���"�" 0 x  V �!W� 
�! 
prmpW m  ��XX �YY  c h o o s e   y e a r�   T Z[Z r  ��\]\ n  ��^_^ 4  ���`
� 
cobj` m  ���� _ 1  ���
� 
rslt] o      �� 0 curyear  [ a�a r  ��bcb m  ���
� boovfalsc o      �� 0 monthexists  �  �,  7 r  ��ded m  ���
� boovtruee o      �� 0 monthexists  �-   � H   � �ff o   � ��� 0 choosenproject   � m   � �gg�                                                                                  fstp  alis    P  
Subversion                 �1ubH+  QڶAperture.app                                                   X28Ψ�        ����  	                Applications    �1�      ΨU�    Qڶ  %Subversion:Applications: Aperture.app     A p e r t u r e . a p p   
 S u b v e r s i o n  Applications/Aperture.app   / ��  �a  �`   � hih l     ����  �  �  i jkj l ��l��l r  ��mnm c  ��opo n  ��qrq I  ���s�� 0 monthtointeger  s t�t o  ���� 0 curmonth  �  �  r o  ���� *0 loadedexportlibrary loadedExportLibraryp m  ���
� 
TEXTn o      �
�
 0 monthint  �  �  k uvu l � w�	�w Z  � xy��x = ��z{z n  ��|}| 1  ���
� 
leng} o  ���� 0 monthint  { m  ���� y r  ��~~ b  ����� m  ���� ���  0� o  ���� 0 monthint   o      �� 0 monthint  �  �  �	  �  v ��� l     � �����   ��  ��  � ��� l ������ r  ��� b  ��� b  ��� b  
��� b  ��� o  ���� 0 curyear  � m  �� ���  /� o  	���� 0 monthint  � m  
�� ���  /� o  ���� 0 pr  � o      ���� 0 ymp  ��  ��  � ��� l &������ r  &��� b  "��� b  ��� o  ���� 0 publishedpath PublishedPath� m  �� ���  / f u l l s i z e /� o  !���� 0 ymp  � o      ���� 0 fullsizepath fullsizePath��  ��  � ��� l '6������ r  '6��� b  '2��� b  '.��� o  '*���� 0 publishedpath PublishedPath� m  *-�� ���  / l a r g e /� o  .1���� 0 ymp  � o      ���� 0 	largepath 	largePath��  ��  � ��� l 7F������ r  7F��� b  7B��� b  7>��� o  7:���� 0 publishedpath PublishedPath� m  :=�� ���  / m a s t e r s /� o  >A���� 0 ymp  � o      ���� 0 masterspath mastersPath��  ��  � ��� l GV������ r  GV��� b  GR��� b  GN��� o  GJ���� 0 publishedpath PublishedPath� m  JM�� ���  / t h u m b s /� o  NQ���� 0 ymp  � o      ���� 0 
thumbspath 
thumbsPath��  ��  � ��� l Wf������ r  Wf��� b  Wb��� b  W^��� o  WZ���� 0 publishedpath PublishedPath� m  Z]�� ���  / m e d i u m /� o  ^a���� 0 ymp  � o      ���� 0 
mediumpath 
mediumPath��  ��  � ��� l gv������ r  gv��� b  gr��� b  gn��� o  gj���� 0 publishedpath PublishedPath� m  jm�� ���  /� o  nq���� 0 ymp  � o      ���� 0 rootpath rootPath��  ��  � ��� l     ��������  ��  ��  � ��� l w������� O  w���� O  }���� O  ����� O  ����� k  ���� ��� l ��������  �   get the project notes   � ��� ,   g e t   t h e   p r o j e c t   n o t e s� ��� r  ����� b  ����� b  ����� b  ����� b  ����� o  ������ 	0 p_sql  � l �������� n  ����� 1  ����
�� 
strq� o  ������ 0 
libdbposix 
libDBPOSIX��  ��  � m  ���� ��� `   " s e l e c t   n o t e   f r o m   R K N O T E   w h e r e   A T T A C H E D T O U U I D = '� 1  ����
�� 
ID  � m  ���� ���  ' "� o      ���� 0 	thescript  � � � r  �� I ������
�� .sysoexecTEXT���     TEXT o  ������ 0 	thescript  ��   o      ���� 	0 notes     l ����������  ��  ��    r  ��	 c  ��

 l ������ 6�� 2  ����
�� 
rkdp G  �� l ������ ? �� 1  ����
�� 
rkmr m  ������ ��  ��   l ������ = �� 1  ����
�� 
rkvc m  ����
�� rkclrkRD��  ��  ��  ��   m  ����
�� 
list	 o      ���� 
0 cursel    l ����������  ��  ��   �� n  �� I  �������� 0 
seturgency 
setUrgency �� o  ������ 0 pr  ��  ��   o  ������ *0 loadedexportlibrary loadedExportLibrary��  � 4  ����
�� 
rkpj o  ������ 0 pr  � 4  ����
�� 
rkfl o  ������ 0 curmonth  � 4  }��� 
�� 
rkfl  o  ������ 0 curyear  � m  wz!!�                                                                                  fstp  alis    P  
Subversion                 �1ubH+  QڶAperture.app                                                   X28Ψ�        ����  	                Applications    �1�      ΨU�    Qڶ  %Subversion:Applications: Aperture.app     A p e r t u r e . a p p   
 S u b v e r s i o n  Applications/Aperture.app   / ��  ��  ��  � "#" l     ��������  ��  ��  # $%$ l     ��&'��  &  delete the old versions   ' �(( . d e l e t e   t h e   o l d   v e r s i o n s% )*) l �"+����+ Z  �",-����, n  �./. I  ���0���� 0 
fileexists 
fileExists0 1��1 n  �232 1   ��
�� 
psxp3 o  � ���� 0 fullsizepath fullsizePath��  ��  / o  ������ *0 loadedexportlibrary loadedExportLibrary- k  44 565 r  787 b  9:9 m  ;; �<<  r m   - r  : o  ���� 0 fullsizepath fullsizePath8 o      ���� 0 	thescript  6 =��= I ��>��
�� .sysoexecTEXT���     TEXT> o  ���� 0 	thescript  ��  ��  ��  ��  ��  ��  * ?@? l     ��������  ��  ��  @ ABA l #IC����C Z  #IDE����D n  #/FGF I  $/��H���� 0 
fileexists 
fileExistsH I��I n  $+JKJ 1  '+��
�� 
psxpK o  $'���� 0 
thumbspath 
thumbsPath��  ��  G o  #$���� *0 loadedexportlibrary loadedExportLibraryE k  2ELL MNM r  2=OPO b  29QRQ m  25SS �TT  r m   - r  R o  58���� 0 
thumbspath 
thumbsPathP o      ���� 0 	thescript  N U��U I >E��V��
�� .sysoexecTEXT���     TEXTV o  >A���� 0 	thescript  ��  ��  ��  ��  ��  ��  B WXW l     ��������  ��  ��  X YZY l Jp[��~[ Z  Jp\]�}�|\ n  JV^_^ I  KV�{`�z�{ 0 
fileexists 
fileExists` a�ya n  KRbcb 1  NR�x
�x 
psxpc o  KN�w�w 0 masterspath mastersPath�y  �z  _ o  JK�v�v *0 loadedexportlibrary loadedExportLibrary] k  Yldd efe r  Ydghg b  Y`iji m  Y\kk �ll  r m   - r  j o  \_�u�u 0 masterspath mastersPathh o      �t�t 0 	thescript  f m�sm I el�rn�q
�r .sysoexecTEXT���     TEXTn o  eh�p�p 0 	thescript  �q  �s  �}  �|  �  �~  Z opo l     �o�n�m�o  �n  �m  p qrq l q�s�l�ks Z  q�tu�j�it n  q}vwv I  r}�hx�g�h 0 
fileexists 
fileExistsx y�fy n  ryz{z 1  uy�e
�e 
psxp{ o  ru�d�d 0 
mediumpath 
mediumPath�f  �g  w o  qr�c�c *0 loadedexportlibrary loadedExportLibraryu k  ��|| }~} r  ��� b  ����� m  ���� ���  r m   - r  � o  ���b�b 0 
mediumpath 
mediumPath� o      �a�a 0 	thescript  ~ ��`� I ���_��^
�_ .sysoexecTEXT���     TEXT� o  ���]�] 0 	thescript  �^  �`  �j  �i  �l  �k  r ��� l     �\�[�Z�\  �[  �Z  � ��� l ����Y�X� Z  �����W�V� n  ����� I  ���U��T�U 0 
fileexists 
fileExists� ��S� n  ����� 1  ���R
�R 
psxp� o  ���Q�Q 0 	largepath 	largePath�S  �T  � o  ���P�P *0 loadedexportlibrary loadedExportLibrary� k  ���� ��� r  ����� b  ����� m  ���� ���  r m   - r  � o  ���O�O 0 	largepath 	largePath� o      �N�N 0 	thescript  � ��M� I ���L��K
�L .sysoexecTEXT���     TEXT� o  ���J�J 0 	thescript  �K  �M  �W  �V  �Y  �X  � ��� l     �I�H�G�I  �H  �G  � ��� l ����F�E� Z  �����D�C� n  ����� I  ���B��A�B 0 
fileexists 
fileExists� ��@� n  ����� 1  ���?
�? 
psxp� o  ���>�> 0 rootpath rootPath�@  �A  � o  ���=�= *0 loadedexportlibrary loadedExportLibrary� k  ���� ��� r  ����� b  ����� m  ���� ���  r m   - r  � o  ���<�< 0 rootpath rootPath� o      �;�; 0 	thescript  � ��:� I ���9��8
�9 .sysoexecTEXT���     TEXT� o  ���7�7 0 	thescript  �8  �:  �D  �C  �F  �E  � ��� l     �6�5�4�6  �5  �4  � ��� l     �3���3  �   make the directories   � ��� *   m a k e   t h e   d i r e c t o r i e s� ��� l ���2�1� r  ���� b  ���� b  ���� b  ���� b  �	��� b  ���� b  ���� b  ����� b  ����� b  ����� b  ����� b  ����� m  ���� ���  m k d i r   - p  � o  ���0�0 0 
thumbspath 
thumbsPath� m  ���� ���  ;   m k d i r   - p  � o  ���/�/ 0 
mediumpath 
mediumPath� m  ���� ���  ;   m k d i r   - p  � o  ���.�. 0 masterspath mastersPath� m  � �� ���  ;   m k d i r   - p  � o  �-�- 0 fullsizepath fullsizePath� m  �� ���  ;   m k d i r   - p  � o  	�,�, 0 rootpath rootPath� m  �� ���  ;   m k d i r   - p  � o  �+�+ 0 	largepath 	largePath� o      �*�* 0 	thescript  �2  �1  � ��� l     �)���)  � L Fmaking thumbspath with the -p option causes fullsizePath to be created   � ��� � m a k i n g   t h u m b s p a t h   w i t h   t h e   - p   o p t i o n   c a u s e s   f u l l s i z e P a t h   t o   b e   c r e a t e d� ��� l !��(�'� I !�&��%
�& .sysoexecTEXT���     TEXT� o  �$�$ 0 	thescript  �%  �(  �'  � ��� l     �#�"�!�#  �"  �!  � ��� l     � ���   �  **** Export the pics ****   � ��� 2 * * * *   E x p o r t   t h e   p i c s   * * * *� ��� l ";���� n  ";��� I  #;���� 0 
exportpics 
exportPics� ��� o  #&�� 
0 cursel  � ��� o  &)�� 0 
libdbposix 
libDBPOSIX� � � o  ),�� 0 	largepath 	largePath   o  ,/�� 0 
thumbspath 
thumbsPath  o  /2�� 0 
mediumpath 
mediumPath � o  25�� 0 fullsizepath fullsizePath�  �  � o  "#�� *0 loadedexportlibrary loadedExportLibrary�  �  �  l     ����  �  �   	 l     �
�  
 $ **** Add links to masters ****    � < * * * *   A d d   l i n k s   t o   m a s t e r s   * * * *	  l <J�� n  <J I  =J��� 0 addlinks addLinks  o  =@�� 
0 cursel    o  @C�
�
 0 masterspath mastersPath �	 o  CF�� 0 
libdbposix 
libDBPOSIX�	  �   o  <=�� *0 loadedexportlibrary loadedExportLibrary�  �    l     ����  �  �    l     ��     **** export the notes ****    � 4 * * * *   e x p o r t   t h e   n o t e s   * * * *   l Kb!��! r  Kb"#" b  K^$%$ b  KZ&'& b  KV()( b  KR*+* m  KN,, �--  e c h o   "+ o  NQ� �  	0 notes  ) m  RU.. �//  " >  ' o  VY���� 0 rootpath rootPath% m  Z]00 �11  / n o t e s . t x t# o      ���� 0 	thescript  �  �    232 l cj4����4 I cj��5��
�� .sysoexecTEXT���     TEXT5 o  cf���� 0 	thescript  ��  ��  ��  3 676 l     ��������  ��  ��  7 898 l     ��:;��  : $ **** Create the html file ****   ; �<< < * * * *   C r e a t e   t h e   h t m l   f i l e   * * * *9 =>= l kv?����? r  kv@A@ b  krBCB m  knDD �EE B / U s e r s / i a i n / b i n / b u i l d - s h o o t - p a g e  C o  nq���� 0 rootpath rootPathA o      ���� 0 	thescript  ��  ��  > FGF l w~H����H I w~��I��
�� .ascrcmnt****      � ****I o  wz���� 0 	thescript  ��  ��  ��  G J��J l �K����K I ���L��
�� .sysoexecTEXT���     TEXTL o  ����� 0 	thescript  ��  ��  ��  ��       "��M INOPQRST��UV �WX�� � ���YZ[\]^_`abcde����  M  ������������������������������������������������������������������ 	0 p_sql  
�� .aevtoappnull  �   � ****�� 0 curyear  �� 0 curmonth  �� 0 librarypath libraryPath�� *0 loadedexportlibrary loadedExportLibrary�� 0 	g_libpath 	g_libPath�� 0 theout theOut�� 0 	libcopied 	libCopied�� 0 libposix libPOSIX�� 0 
libdbposix 
libDBPOSIX�� 0 publishedpath PublishedPath�� 
0 curday  �� 0 curtime  �� 0 monthexists  �� 0 changemonthmessage  �� 0 changeyearmessage  �� 0 choosenproject  �� 0 pr  �� 0 x  �� 0 monthint  �� 0 ymp  �� 0 fullsizepath fullsizePath�� 0 	largepath 	largePath�� 0 masterspath mastersPath�� 0 
thumbspath 
thumbsPath�� 0 
mediumpath 
mediumPath�� 0 rootpath rootPath�� 0 	thescript  �� 	0 notes  �� 
0 cursel  ��  N ��f����gh��
�� .aevtoappnull  �   � ****f k    �ii  jj   kk  1ll  @mm  Snn  Zoo  app  fqq  mrr  }ss  �tt  �uu  �vv  �ww  �xx  �yy  �zz  �{{ j|| u}} �~~ � ��� ��� ��� ��� ��� ��� )�� A�� Y�� q�� ��� ��� ��� ��� ��� �� �� 2�� =�� F�� J����  ��  ��  g  h j�������������������� >�������������������� w�� ��������������� ��� �������g���������� ���������+�HLX���������������������������������������������������~�}�|;Sk����������{�z�y,.0D
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
cobj
�� .ascrcmnt****      � ****�  �� 0 monthtointeger  �� 0 monthint  
�� 
leng�� 0 ymp  �� 0 fullsizepath fullsizePath�� 0 	largepath 	largePath�� 0 masterspath mastersPath�� 0 
thumbspath 
thumbsPath�� 0 
mediumpath 
mediumPath�� 0 rootpath rootPath
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
� 
list�~ 
0 cursel  �} 0 
seturgency 
setUrgency�| 0 
fileexists 
fileExists�{ �z 0 
exportpics 
exportPics�y 0 addlinks addLinks���*j  �,�&E�O*j  �,�&E�O*����l 	�%/E�O�j E�O�j+ E�O_ E` OfE` O�a ,E` O_ a %�&E` Oa E` O*j  a ,�&E` O*j  a ,�&E` O���l+  
eE` Y fE` Oa E`  Oa !E` "OfE` #O_  E` $Oa %h_ #_  Y*a &�/ L*a &�/ BeE` #O*a '-a (,EE` )O_  _ )6FO_ )a *a +l ,O_ -a .k/E` $O_ $j /UUY hO_ $_    DfE` #O*a &�/ 1*a &-a (,E` )O_ "_ )6FO_ )a *a 0l ,O_ -a .k/E�UY hO�_ "  O*a &-a (,a 1[[a (,\Za 2@C\[a (,\Za 3>A1E` )O_ )a *a 4l ,O_ -a .k/E�OfE` Y eE` [OY��UO��k+ 5�&E` 6O_ 6a 7,k  a 8_ 6%E` 6Y hO�a 9%_ 6%a :%_ $%E` ;O_ a <%_ ;%E` =O_ a >%_ ;%E` ?O_ a @%_ ;%E` AO_ a B%_ ;%E` CO_ a D%_ ;%E` EO_ a F%_ ;%E` GOa % *a &�/ u*a &�/ k*a '_ $/ _b   _ a H,%a I%*a J,%a K%E` LO_ Lj ME` NO*a O-a 1[[a P,\Zl:\[a Q,\Za R8B1a S&E` TO�_ $k+ UUUUUO�_ =a ,k+ V a W_ =%E` LO_ Lj MY hO�_ Ca ,k+ V a X_ C%E` LO_ Lj MY hO�_ Aa ,k+ V a Y_ A%E` LO_ Lj MY hO�_ Ea ,k+ V a Z_ E%E` LO_ Lj MY hO�_ ?a ,k+ V a [_ ?%E` LO_ Lj MY hO�_ Ga ,k+ V a \_ G%E` LO_ Lj MY hOa ]_ C%a ^%_ E%a _%_ A%a `%_ =%a a%_ G%a b%_ ?%E` LO_ Lj MO�_ T_ _ ?_ C_ E_ =a c+ dO�_ T_ A_ m+ eOa f_ N%a g%_ G%a h%E` LO_ Lj MOa i_ G%E` LO_ Lj /O_ Lj MO ���  2 0 1 4P ��� 
 A p r i lQ�alis    �   
Subversion                 �1ubH+   sɷExportLibrary.scpt                                             �^�ò�osasToyS����  	                ApertureExport    �1�      ��P+     sɷ c �| �  @Subversion:Users: iain: Code: ApertureExport: ExportLibrary.scpt  &  E x p o r t L i b r a r y . s c p t   
 S u b v e r s i o n  1Users/iain/Code/ApertureExport/ExportLibrary.scpt   /    ��  R �x� ��x  � k      �� ��� j     �w��w 	0 p_sql  � m     �� ��� " / u s r / b i n / s q l i t e 3  � ��� l     �v�u�t�v  �u  �t  � ��� i    ��� I      �s��r�s 0 
fileexists 
fileExists� ��q� o      �p�p 0 	posixpath 	posixPath�q  �r  � L     �� c     ��� l    ��o�n� c     ��� l    ��m�l� I    �k��j
�k .sysoexecTEXT���     TEXT� b     ��� b     ��� m     �� ���  i f   l s  � n    ��� 1    �i
�i 
strq� o    �h�h 0 	posixpath 	posixPath� m    �� ��� T   & > / d e v / n u l l ;   t h e n 
 e c h o   1 ; 
 e l s e 
 e c h o   0 ; 
 f i�j  �m  �l  � m    �g
�g 
long�o  �n  � m    �f
�f 
bool� ��� l     �e�d�c�e  �d  �c  � ��� i    
��� I      �b��a�b 0 folderexists  � ��� o      �`�` 0 
folderyear  � ��_� o      �^�^ 0 foldermonth  �_  �a  � O     1��� k    0�� ��� Z    -���]�\� I   �[��Z
�[ .coredoexnull���     ****� 4    �Y�
�Y 
rkfl� o    �X�X 0 
folderyear  �Z  � O    )��� Z    (���W�� I   �V��U
�V .coredoexnull���     ****� 4    �T�
�T 
rkfl� o    �S�S 0 foldermonth  �U  � L   ! #�� m   ! "�R
�R boovtrue�W  � L   & (�� m   & '�Q
�Q boovfals� 4    �P�
�P 
rkfl� o    �O�O 0 
folderyear  �]  �\  � ��N� L   . 0�� m   . /�M
�M boovfals�N  � m     ���                                                                                  fstp  alis    P  
Subversion                 �1ubH+  QڶAperture.app                                                   X28Ψ�        ����  	                Applications    �1�      ΨU�    Qڶ  %Subversion:Applications: Aperture.app     A p e r t u r e . a p p   
 S u b v e r s i o n  Applications/Aperture.app   / ��  � ��� l     �L�K�J�L  �K  �J  � ��� l     �I�H�G�I  �H  �G  � ��� l     �F�E�D�F  �E  �D  � ��� i    ��� I      �C��B�C 0 monthtointeger  � ��A� o      �@�@ 0 monthstring  �A  �B  � L     �� c     ��� n     
��� m    
�?
�? 
mnth� 4     �>�
�> 
ldt � l   ��=�<� b    ��� b    ��� m    �� ���  1 /� o    �;�; 0 monthstring  � m    �� ��� 
 / 2 0 1 2�=  �<  � m   
 �:
�: 
long� ��� l     �9�8�7�9  �8  �7  � ��� i    ��� I      �6��5�6 0 monthtostring  � ��4� o      �3�3 0 monthint  �4  �5  � L     �� c     ��� n     
� � m    
�2
�2 
mnth  4     �1
�1 
ldt  l   �0�/ b     b     m     �  1 / o    �.�. 0 monthint   m    		 �

 
 / 2 0 1 2�0  �/  � m   
 �-
�- 
TEXT�  l     �,�+�*�,  �+  �*    i     I      �)�(�) 0 chooseproject chooseProject �' o      �&�& 0 adate aDate�'  �(   k      r      c      n      1    �%
�% 
year o     �$�$ 0 adate aDate m    �#
�# 
TEXT o      �"�" 0 curyear    r     c     !  n    "#" m   	 �!
�! 
mnth# o    	� �  0 adate aDate! m    �
� 
TEXT o      �� 0 curmonth   $%$ r    &'& c    ()( n    *+* 1    �
� 
day + o    �� 0 adate aDate) m    �
� 
TEXT' o      �� 
0 curday  % ,-, r    ./. c    010 n    232 1    �
� 
time3 o    �� 0 adate aDate1 m    �
� 
TEXT/ o      �� 0 curtime  - 454 l     ����  �  �  5 676 Z     389�:8 I     '�;�� 0 folderexists  ; <=< o   ! "�� 0 curyear  = >�> o   " #�� 0 curmonth  �  �  9 r   * -?@? m   * +�
� boovtrue@ o      �� 0 monthexists  �  : r   0 3ABA m   0 1�

�
 boovfalsB o      �	�	 0 monthexists  7 CDC l  4 4����  �  �  D EFE r   4 7GHG m   4 5II �JJ $ * *   C h a n g e   m o n t h   * *H o      �� 0 changemonthmessage  F KLK r   8 ;MNM m   8 9OO �PP " * *   C h a n g e   y e a r   * *N o      �� 0 changeyearmessage  L QRQ r   < ?STS m   < =�
� boovfalsT o      �� 0 choosenproject  R UVU r   @ CWXW o   @ A�� 0 changemonthmessage  X o      � �  0 pr  V YZY l  D D��������  ��  ��  Z [��[ O   D\]\ k   H^^ _`_ V   H	aba k   Occ ded l  O O��fg��  f / )if curmonth is not changeyearmessage then   g �hh R i f   c u r m o n t h   i s   n o t   c h a n g e y e a r m e s s a g e   t h e ne iji Z   O �kl����k o   O P���� 0 monthexists  l O   S �mnm O   Z �opo k   a �qq rsr r   a dtut m   a b��
�� boovtrueu o      ���� 0 choosenproject  s vwv r   e mxyx e   e kzz n   e k{|{ 1   h j��
�� 
pnam| 2   e h��
�� 
rkpjy o      ���� 0 x  w }~} r   n r� o   n o���� 0 changemonthmessage  � n      ���  ;   p q� o   o p���� 0 x  ~ ��� I  s z����
�� .gtqpchltns    @   @ ns  � o   s t���� 0 x  � �����
�� 
prmp� m   u v�� ���   C h o o s e   a   p r o j e c t��  � ���� r   { ���� n   { ���� 4   | ����
�� 
cobj� m    ����� � 1   { |��
�� 
rslt� o      ���� 0 pr  ��  p 4   Z ^���
�� 
rkfl� o   \ ]���� 0 curmonth  n 4   S W���
�� 
rkfl� o   U V���� 0 curyear  ��  ��  j ��� Z   � �������� =  � ���� o   � ����� 0 pr  � o   � ����� 0 changemonthmessage  � k   � ��� ��� r   � ���� m   � ���
�� boovfals� o      ���� 0 choosenproject  � ���� O   � ���� k   � ��� ��� r   � ���� n   � ���� 1   � ���
�� 
pnam� 2   � ���
�� 
rkfl� o      ���� 0 x  � ��� r   � ���� o   � ����� 0 changeyearmessage  � n      ���  ;   � �� o   � ����� 0 x  � ��� I  � �����
�� .gtqpchltns    @   @ ns  � o   � ����� 0 x  � �����
�� 
prmp� m   � ��� ���  c h o o s e   m o n t h��  � ���� r   � ���� n   � ���� 4   � ����
�� 
cobj� m   � ����� � 1   � ���
�� 
rslt� o      ���� 0 curmonth  ��  � 4   � ����
�� 
rkfl� o   � ����� 0 curyear  ��  ��  ��  � ���� Z   ������� =  � ���� o   � ����� 0 curmonth  � o   � ����� 0 changeyearmessage  � k   � ��� ��� r   � ���� 6 � ���� n   � ���� 1   � ���
�� 
pnam� 2   � ���
�� 
rkfl� F   � ���� H   � ��� E   � ���� 1   � ���
�� 
pnam� m   � ��� ���  -� C   � ���� 1   � ���
�� 
pnam� m   � ��� ���  2� o      ���� 0 x  � ��� l  � �������  � J D Lazy programming. Must get round to fixing it before the year 3000.   � ��� �   L a z y   p r o g r a m m i n g .   M u s t   g e t   r o u n d   t o   f i x i n g   i t   b e f o r e   t h e   y e a r   3 0 0 0 .� ��� I  � �����
�� .gtqpchltns    @   @ ns  � o   � ����� 0 x  � �����
�� 
prmp� m   � ��� ���  c h o o s e   y e a r��  � ��� r   � ���� n   � ���� 4   � ����
�� 
cobj� m   � ����� � 1   � ���
�� 
rslt� o      ���� 0 curyear  � ���� r   � ���� m   � ���
�� boovfals� o      ���� 0 monthexists  ��  ��  � r  ��� m  ��
�� boovtrue� o      ���� 0 monthexists  ��  b H   L N�� o   L M���� 0 choosenproject  ` ���� L  
�� o  
���� 0 pr  ��  ] m   D E���                                                                                  fstp  alis    P  
Subversion                 �1ubH+  QڶAperture.app                                                   X28Ψ�        ����  	                Applications    �1�      ΨU�    Qڶ  %Subversion:Applications: Aperture.app     A p e r t u r e . a p p   
 S u b v e r s i o n  Applications/Aperture.app   / ��  ��   ��� l     ��������  ��  ��  � ��� i    ��� I      ������� 0 
seturgency 
setUrgency� ���� o      ���� 0 pr  ��  ��  � O     ���� O    ���� k    ��� ��� l   �� ��    W Q Digikam uses Urgency to store the ratings, so convert Aperture rating to urgency    � �   D i g i k a m   u s e s   U r g e n c y   t o   s t o r e   t h e   r a t i n g s ,   s o   c o n v e r t   A p e r t u r e   r a t i n g   t o   u r g e n c y�  O    ) I   (����
�� .corecrel****      � null��   ��	
�� 
kocl m    ��
�� 
rkip	 ��
��
�� 
prdt
 K    $ ��
�� 
pnam m      �  U r g e n c y ����
�� 
rkvl m   ! " �  1��  ��   l   ���� 6   2    ��
�� 
rkdp =    1    ��
�� 
rkmr m    ���� ��  ��    O   * J I  9 I����
�� .corecrel****      � null��   ��
�� 
kocl m   ; <��
�� 
rkip ����
�� 
prdt K   = E   ��!"
�� 
pnam! m   > ?## �$$  U r g e n c y" ��%��
�� 
rkvl% m   @ C&& �''  2��  ��   l  * 6(����( 6 * 6)*) 2   * -��
�� 
rkdp* =  . 5+,+ 1   / 1��
�� 
rkmr, m   2 4���� ��  ��   -.- O   K m/0/ I  Z l����1
�� .corecrel****      � null��  1 ��23
�� 
kocl2 m   \ ]��
�� 
rkip3 ��4��
�� 
prdt4 K   ^ h55 ��67
�� 
pnam6 m   _ b88 �99  U r g e n c y7 ��:��
�� 
rkvl: m   c f;; �<<  4��  ��  0 l  K W=����= 6 K W>?> 2   K N��
�� 
rkdp? =  O V@A@ 1   P R��
�� 
rkmrA m   S U���� ��  ��  . BCB O   n �DED I  } ����F
�� .corecrel****      � null�  F �~GH
�~ 
koclG m    ��}
�} 
rkipH �|I�{
�| 
prdtI K   � �JJ �zKL
�z 
pnamK m   � �MM �NN  U r g e n c yL �yO�x
�y 
rkvlO m   � �PP �QQ  5�x  �{  E l  n zR�w�vR 6 n zSTS 2   n q�u
�u 
rkdpT =  r yUVU 1   s u�t
�t 
rkmrV m   v x�s�s �w  �v  C W�rW O   � �XYX I  � ��q�pZ
�q .corecrel****      � null�p  Z �o[\
�o 
kocl[ m   � ��n
�n 
rkip\ �m]�l
�m 
prdt] K   � �^^ �k_`
�k 
pnam_ m   � �aa �bb  U r g e n c y` �jc�i
�j 
rkvlc m   � �dd �ee  6�i  �l  Y l  � �f�h�gf 6 � �ghg 2   � ��f
�f 
rkdph =  � �iji 1   � ��e
�e 
rkmrj m   � ��d�d �h  �g  �r  � 4    �ck
�c 
rkpjk o    �b�b 0 pr  � m     ll�                                                                                  fstp  alis    P  
Subversion                 �1ubH+  QڶAperture.app                                                   X28Ψ�        ����  	                Applications    �1�      ΨU�    Qڶ  %Subversion:Applications: Aperture.app     A p e r t u r e . a p p   
 S u b v e r s i o n  Applications/Aperture.app   / ��  � mnm l     �a�`�_�a  �`  �_  n opo i    qrq I      �^s�]�^ "0 setexporteddate setExportedDates t�\t o      �[�[ 0 selectedpics selectedPics�\  �]  r k     �uu vwv r     xyx [     	z{z l    |�Z�Y| I    �X�W�V
�X .misccurdldt    ��� null�W  �V  �Z  �Y  { ]    }~} m    �U�U ~ 1    �T
�T 
min y o      �S�S 	0 edate  w � r    ��� c    ��� n    ��� 1    �R
�R 
year� o    �Q�Q 	0 edate  � m    �P
�P 
TEXT� o      �O�O 0 curyear  � ��� r    $��� n   "��� I    "�N��M�N ,0 monthtointegerstring monthToIntegerString� ��L� c    ��� n    ��� m    �K
�K 
mnth� l   ��J�I� I   �H�G�F
�H .misccurdldt    ��� null�G  �F  �J  �I  � m    �E
�E 
TEXT�L  �M  �  f    � o      �D�D 0 curmonth  � ��� r   % ,��� c   % *��� n   % (��� 1   & (�C
�C 
day � o   % &�B�B 	0 edate  � m   ( )�A
�A 
TEXT� o      �@�@ 
0 curday  � ��� Z   - >���?�>� =  - 2��� n   - 0��� 1   . 0�=
�= 
leng� o   - .�<�< 
0 curday  � m   0 1�;�; � r   5 :��� b   5 8��� m   5 6�� ���  0� o   6 7�:�: 
0 curday  � o      �9�9 
0 curday  �?  �>  � ��� r   ? F��� c   ? D��� n   ? B��� 1   @ B�8
�8 
hour� o   ? @�7�7 	0 edate  � m   B C�6
�6 
TEXT� o      �5�5 0 curhour  � ��� Z   G X���4�3� =  G L��� n   G J��� 1   H J�2
�2 
leng� o   G H�1�1 0 curhour  � m   J K�0�0 � r   O T��� b   O R��� m   O P�� ���  0� o   P Q�/�/ 0 curhour  � o      �.�. 0 curhour  �4  �3  � ��� r   Y `��� c   Y ^��� n   Y \��� 1   Z \�-
�- 
min � o   Y Z�,�, 	0 edate  � m   \ ]�+
�+ 
TEXT� o      �*�* 0 curmins  � ��� Z   a r���)�(� =  a f��� n   a d��� 1   b d�'
�' 
leng� o   a b�&�& 0 curmins  � m   d e�%�% � r   i n��� b   i l��� m   i j�� ���  0� o   j k�$�$ 0 curmins  � o      �#�# 0 curmins  �)  �(  � ��� r   s z��� c   s x��� n   s v��� m   t v�"
�" 
scnd� o   s t�!�! 	0 edate  � m   v w� 
�  
TEXT� o      �� 0 cursecs  � ��� Z   { ������ =  { ���� n   { ~��� 1   | ~�
� 
leng� o   { |�� 0 cursecs  � m   ~ �� � r   � ���� b   � ���� m   � ��� ���  0� o   � ��� 0 cursecs  � o      �� 0 cursecs  �  �  � ��� r   � ���� b   � ���� b   � ���� b   � ���� b   � ���� b   � ���� b   � ���� b   � ���� o   � ��� 0 curyear  � o   � ��� 0 curmonth  � o   � ��� 
0 curday  � m   � ��� ���  T� o   � ��� 0 curhour  � o   � ��� 0 curmins  � o   � ��� 0 cursecs  � m   � �   �  + 0 7� o      �� 0 exporteddate exportedDate�  l  � ���   ) # log "Export date: " & exportedDate    � F   l o g   " E x p o r t   d a t e :   "   &   e x p o r t e d D a t e � O   � �	 X   � �
�
 O   � � k   � �  l  � ���   + % log "setting export date of " & name    � J   l o g   " s e t t i n g   e x p o r t   d a t e   o f   "   &   n a m e � I  � ���

� .corecrel****      � null�
   �	
�	 
kocl m   � ��
� 
rkip ��
� 
prdt K   � � �
� 
pnam m   � � �  R e f e r e n c e D a t e ��
� 
rkvl o   � ��� 0 exporteddate exportedDate�  �  �   o   � ��� 0 pic  � 0 pic   o   � �� �  0 selectedpics selectedPics	 m   � ��                                                                                  fstp  alis    P  
Subversion                 �1ubH+  QڶAperture.app                                                   X28Ψ�        ����  	                Applications    �1�      ΨU�    Qڶ  %Subversion:Applications: Aperture.app     A p e r t u r e . a p p   
 S u b v e r s i o n  Applications/Aperture.app   / ��  �  p  !  l     ��������  ��  ��  ! "#" i    "$%$ I      ��&���� 0 addlinks addLinks& '(' 1      ��
�� 
sele( )*) o      ���� 0 	linkspath 	linksPath* +��+ o      ���� 0 databasepath databasePath��  ��  % k    5,, -.- l     ��/0��  /  log "Adding links"   0 �11 $ l o g   " A d d i n g   l i n k s ". 232 Z     45����4 H     66 n    787 I    ��9���� 0 
fileexists 
fileExists9 :��: o    ���� 0 	linkspath 	linksPath��  ��  8  f     5 k   
 ;; <=< r   
 >?> b   
 @A@ m   
 BB �CC  m k d i r  A o    ���� 0 	linkspath 	linksPath? o      ���� 0 	thescript  = D��D I   ��E��
�� .sysoexecTEXT���     TEXTE o    ���� 0 	thescript  ��  ��  ��  ��  3 FGF r    HIH o    ��
�� 
ret I o      ���� 0 theout theOutG JKJ O   2LML X   "1N��ON k   2,PP QRQ r   2 7STS n   2 5UVU 1   3 5��
�� 
rkrdV o   2 3���� 
0 curimg  T o      ���� 0 isref isRefR WXW r   8 =YZY n   8 ;[\[ 1   9 ;��
�� 
ID  \ o   8 9���� 
0 curimg  Z o      ���� 0 curid curIDX ]^] l  > >��������  ��  ��  ^ _`_ r   > Caba n   > Acdc 1   ? A��
�� 
pnamd o   > ?���� 
0 curimg  b o      ���� 0 curname  ` efe r   D Lghg n   D Jiji 1   H J��
�� 
rkvlj n   D Hklk 4   E H��m
�� 
rkotm m   F Gnn �oo  F i l e N a m el o   D E���� 
0 curimg  h o      ���� 0 
mastername 
masterNamef pqp l  M M��������  ��  ��  q rsr r   M Rtut l  M Pv����v b   M Pwxw l  M Ny����y o   M N���� 0 curname  ��  ��  x m   N Ozz �{{            -          ��  ��  u o      ���� 0 newline newLines |}| l  S S��������  ��  ��  } ~~ Z   S������� =  S V��� o   S T���� 0 isref isRef� m   T U��
�� boovtrue� k   Y�� ��� r   Y n��� b   Y l��� b   Y h��� b   Y f��� b   Y b��� o   Y ^���� 	0 p_sql  � l  ^ a������ n   ^ a��� 1   _ a��
�� 
strq� o   ^ _���� 0 databasepath databasePath��  ��  � m   b e�� ��� ^   " s e l e c t   M A S T E R U U I D   f r o m   R K V E R S I O N   w h e r e   U U I D = '� o   f g���� 0 curid curID� m   h k�� ���  ' "� o      ���� 0 	thescript  � ��� r   o v��� I  o t�����
�� .sysoexecTEXT���     TEXT� o   o p���� 0 	thescript  ��  � o      ���� 0 	zfileuuid 	ZFILEUUID� ��� l  w w��������  ��  ��  � ��� l  w w������  � ' ! ---------- Get the master's path   � ��� B   - - - - - - - - - -   G e t   t h e   m a s t e r ' s   p a t h� ��� r   w ���� b   w ���� b   w ���� b   w ���� b   w ���� o   w |���� 	0 p_sql  � l  | ������ n   | ��� 1   } ��
�� 
strq� o   | }���� 0 databasepath databasePath��  ��  � m   � ��� ��� Z   " s e l e c t   I M A G E P A T H   f r o m   R K M A S T E R   w h e r e   U U I D = '� o   � ����� 0 	zfileuuid 	ZFILEUUID� m   � ��� ���  ' "� o      ���� 0 	thescript  � ��� r   � ���� I  � ������
�� .sysoexecTEXT���     TEXT� o   � ����� 0 	thescript  ��  � o      ���� 0 
zimagepath 
ZIMAGEPATH� ��� l  � ���������  ��  ��  � ��� l  � �������  � , & ---------- Get the master's disk name   � ��� L   - - - - - - - - - -   G e t   t h e   m a s t e r ' s   d i s k   n a m e� ��� r   � ���� b   � ���� b   � ���� b   � ���� b   � ���� o   � ����� 	0 p_sql  � l  � ������� n   � ���� 1   � ���
�� 
strq� o   � ����� 0 databasepath databasePath��  ��  � m   � ��� ��� d   " s e l e c t   F I L E V O L U M E U U I D   f r o m   R K M A S T E R   w h e r e   U U I D = '� o   � ����� 0 	zfileuuid 	ZFILEUUID� m   � ��� ���  ' "� o      ���� 0 	thescript  � ��� r   � ���� I  � ������
�� .sysoexecTEXT���     TEXT� o   � ����� 0 	thescript  ��  � o      ���� "0 zfilevolumeuuid ZFILEVOLUMEUUID� ��� r   � ���� b   � ���� b   � ���� b   � ���� b   � ���� o   � ����� 	0 p_sql  � l  � ������� n   � ���� 1   � ���
�� 
strq� o   � ����� 0 databasepath databasePath��  ��  � m   � ��� ��� P   " s e l e c t   N A M E   f r o m   R K V O L U M E   w h e r e   U U I D = '� o   � ����� "0 zfilevolumeuuid ZFILEVOLUMEUUID� m   � ��� ���  ' "� o      ���� 0 	thescript  � ��� r   � ���� I  � ������
�� .sysoexecTEXT���     TEXT� o   � ����� 0 	thescript  ��  � o      ���� 0 diskname diskName� ��� l  � ���������  ��  ��  � ��� r   � ���� b   � ���� b   � ���� b   � ���� m   � ��� �    / V o l u m e s /� o   � ����� 0 diskname diskName� m   � � �  /� o   � ����� 0 
zimagepath 
ZIMAGEPATH� o      ���� 0 imgpath imgPath�  r   � � b   � � b   � �	
	 o   � ����� 0 	linkspath 	linksPath
 m   � � �  / n   � � 1   � ���
�� 
strq o   � ����� 0 
mastername 
masterName o      ���� 0 linkname linkName  r   � b   � b   �  b   � � b   � � b   � � m   � � �  r m   o   � ����� 0 linkname linkName m   � � �    ;   l n   - s   n   � �!"! 1   � ���
�� 
strq" o   � ����� 0 imgpath imgPath m   � �## �$$    o   ���� 0 linkname linkName o      ���� 0 	thescript   %��% Q  &'��& I 
��(��
�� .sysoexecTEXT���     TEXT( o  
�� 0 	thescript  ��  ' R      �~�}�|
�~ .ascrerr ****      � ****�}  �|  ��  ��  ��  ��   )*) l �{�z�y�{  �z  �y  * +,+ r  "-.- b   /0/ o  �x�x 0 newline newLine0 o  �w�w 0 	thescript  . o      �v�v 0 newline newLine, 121 r  #*343 b  #(565 b  #&787 o  #$�u�u 0 theout theOut8 o  $%�t�t 0 newline newLine6 o  &'�s
�s 
ret 4 o      �r�r 0 theout theOut2 9�q9 l ++�p�o�n�p  �o  �n  �q  �� 
0 curimg  O 1   % &�m
�m 
seleM m    ::�                                                                                  fstp  alis    P  
Subversion                 �1ubH+  QڶAperture.app                                                   X28Ψ�        ����  	                Applications    �1�      ΨU�    Qڶ  %Subversion:Applications: Aperture.app     A p e r t u r e . a p p   
 S u b v e r s i o n  Applications/Aperture.app   / ��  K ;�l; L  35<< o  34�k�k 0 theout theOut�l  # =>= l     �j�i�h�j  �i  �h  > ?@? i   # &ABA I      �gC�f�g 0 
exportpics 
exportPicsC DED o      �e�e 0 selectedpics selectedPicsE FGF o      �d�d 0 databasepath databasePathG HIH o      �c�c 0 	largepath 	largePathI JKJ o      �b�b 0 	thumbpath 	thumbPathK LML o      �a�a 0 
mediumpath 
mediumPathM N�`N o      �_�_ 0 fullsizepath fullsizePath�`  �f  B k    OO PQP I    �^R�]
�^ .ascrcmnt****      � ****R b     STS m     UU �VV  E x p o r t i n g  T o    �\�\ 0 fullsizepath fullsizePath�]  Q WXW r    YZY c    [\[ n    ]^] 1    �[
�[ 
year^ l   _�Z�Y_ I   �X�W�V
�X .misccurdldt    ��� null�W  �V  �Z  �Y  \ m    �U
�U 
TEXTZ o      �T�T 0 curyear  X `a` r    bcb c    ded n    fgf m    �S
�S 
mnthg l   h�R�Qh I   �P�O�N
�P .misccurdldt    ��� null�O  �N  �R  �Q  e m    �M
�M 
TEXTc o      �L�L 0 curmonth  a iji r     +klk c     )mnm n     'opo 1   % '�K
�K 
day p l    %q�J�Iq I    %�H�G�F
�H .misccurdldt    ��� null�G  �F  �J  �I  n m   ' (�E
�E 
TEXTl o      �D�D 
0 curday  j rsr r   , 7tut c   , 5vwv n   , 3xyx 1   1 3�C
�C 
timey l  , 1z�B�Az I  , 1�@�?�>
�@ .misccurdldt    ��� null�?  �>  �B  �A  w m   3 4�=
�= 
TEXTu o      �<�< 0 curtime  s {|{ l  8 8�;�:�9�;  �:  �9  | }~} r   8 C� b   8 A��� b   8 ?��� b   8 =��� b   8 ;��� m   8 9�� ��� 
 / t m p /� o   9 :�8�8 0 curyear  � o   ; <�7�7 0 curmonth  � o   = >�6�6 
0 curday  � o   ? @�5�5 0 curtime  � o      �4�4 0 temppath tempPath~ ��� r   D I��� b   D G��� m   D E�� ���  m k d i r  � o   E F�3�3 0 temppath tempPath� o      �2�2 0 	thescript  � ��� l  J J�1���1  �  log thescript   � ���  l o g   t h e s c r i p t� ��� I  J O�0��/
�0 .sysoexecTEXT���     TEXT� o   J K�.�. 0 	thescript  �/  � ��� l  P P�-�,�+�-  �,  �+  � ��� Z   P o���*�)� H   P W�� n  P V��� I   Q V�(��'�( 0 
fileexists 
fileExists� ��&� o   Q R�%�% 0 	largepath 	largePath�&  �'  �  f   P Q� k   Z k�� ��� I  Z _�$��#
�$ .ascrcmnt****      � ****� o   Z [�"�" 0 	largepath 	largePath�#  � ��� r   ` e��� b   ` c��� m   ` a�� ���  m k d i r   - p  � o   a b�!�! 0 	largepath 	largePath� o      � �  0 	thescript  � ��� I  f k���
� .sysoexecTEXT���     TEXT� o   f g�� 0 	thescript  �  �  �*  �)  � ��� l  p p����  �  �  � ��� Z   p ������ H   p w�� n  p v��� I   q v���� 0 
fileexists 
fileExists� ��� o   q r�� 0 	thumbpath 	thumbPath�  �  �  f   p q� k   z ��� ��� r   z ��� b   z }��� m   z {�� ���  m k d i r   - p� o   { |�� 0 	thumbpath 	thumbPath� o      �� 0 	thescript  � ��� I  � ����
� .sysoexecTEXT���     TEXT� o   � ��� 0 	thescript  �  �  �  �  � ��� l  � ����
�  �  �
  � ��� Z   � ����	�� H   � ��� n  � ���� I   � ����� 0 
fileexists 
fileExists� ��� o   � ��� 0 
mediumpath 
mediumPath�  �  �  f   � �� k   � ��� ��� r   � ���� b   � ���� m   � ��� ���  m k d i r   - p� o   � ��� 0 
mediumpath 
mediumPath� o      �� 0 	thescript  � ��� I  � �� ���
�  .sysoexecTEXT���     TEXT� o   � ����� 0 	thescript  ��  �  �	  �  � ��� l  � ���������  ��  ��  � ��� Z   � �������� H   � ��� n  � ���� I   � �������� 0 
fileexists 
fileExists� ���� o   � ����� 0 fullsizepath fullsizePath��  ��  �  f   � �� k   � ��� ��� r   � ���� b   � ���� m   � ��� ���  m k d i r   - p� o   � ����� 0 fullsizepath fullsizePath� o      ���� 0 	thescript  � ���� I  � ������
�� .sysoexecTEXT���     TEXT� o   � ����� 0 	thescript  ��  ��  ��  ��  � ��� l  � ���������  ��  ��  � ��� l  � �������  �  **** Export the pics ****   � ��� 2 * * * *   E x p o r t   t h e   p i c s   * * * *� ��� O   ��� � t   �� k   ��  I  � ���
�� .rkstrkxpnull���     **** o   � ����� 0 selectedpics selectedPics ��	
�� 
nmfi 4   � ���

�� 
rknp
 m   � � �  V e r s i o n   N a m e	 ��
�� 
faal 4   � ���
�� 
rkes m   � � � ( J P E G   -   O r i g i n a l   S i z e ����
�� 
insh o   � ����� 0 temppath tempPath��    r   � � b   � � b   � � b   � � m   � � �  m v   o   � ����� 0 temppath tempPath m   � � �    / *   o   � ����� 0 fullsizepath fullsizePath o      ���� 0 	thescript   !"! I  � ���#��
�� .sysoexecTEXT���     TEXT# o   � ����� 0 	thescript  ��  " $%$ I  ���&'
�� .rkstrkxpnull���     ****& o   � ����� 0 selectedpics selectedPics' ��()
�� 
nmfi( 4  
��*
�� 
rknp* m  	++ �,,  V e r s i o n   N a m e) ��-.
�� 
faal- 4  ��/
�� 
rkes/ m  00 �11 : J P E G   -   F i t   w i t h i n   2 0 4 8   x   2 0 4 8. ��2��
�� 
insh2 o  ���� 0 temppath tempPath��  % 343 r   +565 b   )787 b   %9:9 m   #;; �<< < / U s e r s / i a i n / b i n / a d d - w a t e r m a r k  : o  #$���� 0 temppath tempPath8 m  %(== �>>  / * . j p g  6 o      ���� 0 	thescript  4 ?@? I ,1��A��
�� .sysoexecTEXT���     TEXTA o  ,-���� 0 	thescript  ��  @ BCB r  2?DED b  2=FGF b  2;HIH b  27JKJ m  25LL �MM  m v  K o  56���� 0 temppath tempPathI m  7:NN �OO  / *  G o  ;<���� 0 	largepath 	largePathE o      ���� 0 	thescript  C PQP I @E��R��
�� .sysoexecTEXT���     TEXTR o  @A���� 0 	thescript  ��  Q STS I Fg��UV
�� .rkstrkxpnull���     ****U o  FG���� 0 selectedpics selectedPicsV ��WX
�� 
nmfiW 4  JR��Y
�� 
rknpY m  NQZZ �[[  V e r s i o n   N a m eX ��\]
�� 
faal\ 4  U]��^
�� 
rkes^ m  Y\__ �``   J P E G   -   T h u m b n a i l] ��a��
�� 
insha o  `a���� 0 temppath tempPath��  T bcb r  huded b  hsfgf b  hqhih b  hmjkj m  hkll �mm  m v  k o  kl���� 0 temppath tempPathi m  mpnn �oo  / *  g o  qr���� 0 	thumbpath 	thumbPathe o      ���� 0 	thescript  c pqp I v{��r��
�� .sysoexecTEXT���     TEXTr o  vw���� 0 	thescript  ��  q sts I |���uv
�� .rkstrkxpnull���     ****u o  |}���� 0 selectedpics selectedPicsv ��wx
�� 
nmfiw 4  ����y
�� 
rknpy m  ��zz �{{  V e r s i o n   N a m ex ��|}
�� 
faal| 4  ����~
�� 
rkes~ m  �� ��� : J P E G   -   F i t   w i t h i n   1 0 2 4   x   1 0 2 4} �����
�� 
insh� o  ������ 0 temppath tempPath��  t ��� r  ����� b  ����� b  ����� m  ���� ��� < / U s e r s / i a i n / b i n / a d d - w a t e r m a r k  � o  ������ 0 temppath tempPath� m  ���� ���  / * . j p g  � o      ���� 0 	thescript  � ��� I �������
�� .sysoexecTEXT���     TEXT� o  ������ 0 	thescript  ��  � ��� r  ����� b  ����� b  ����� b  ����� m  ���� ���  m v  � o  ������ 0 temppath tempPath� m  ���� ���  / *  � o  ������ 0 
mediumpath 
mediumPath� o      ���� 0 	thescript  � ���� I �������
�� .sysoexecTEXT���     TEXT� o  ������ 0 	thescript  ��  ��   m   � �����  m   � ����                                                                                  fstp  alis    P  
Subversion                 �1ubH+  QڶAperture.app                                                   X28Ψ�        ����  	                Applications    �1�      ΨU�    Qڶ  %Subversion:Applications: Aperture.app     A p e r t u r e . a p p   
 S u b v e r s i o n  Applications/Aperture.app   / ��  � ��� l ����������  ��  ��  � ��� n ����� I  ��������� "0 setexporteddate setExportedDate� ���� o  ������ 0 selectedpics selectedPics��  ��  �  f  ��� ��� l ����������  ��  ��  � ��� l ��������  � K E**** Get rid of spaces and brackets in filenames (damn you apple)****   � ��� � * * * *   G e t   r i d   o f   s p a c e s   a n d   b r a c k e t s   i n   f i l e n a m e s   ( d a m n   y o u   a p p l e ) * * * *� ��� r  ����� J  ���� ��� o  ������ 0 
mediumpath 
mediumPath� ��� o  ������ 0 	thumbpath 	thumbPath� ��� o  ������ 0 	largepath 	largePath� ���� o  ������ 0 fullsizepath fullsizePath��  � o      ���� 0 fixpaths  � ��� l ��������  � / ) log "Getting rid of spaces in filenames"   � ��� R   l o g   " G e t t i n g   r i d   o f   s p a c e s   i n   f i l e n a m e s "� ��� X  ������ k  ��� ��� r  ����� b  ����� b  ����� b  ����� b  ����� m  ���� ���  f o r   f i l e   i n  � o  ������ 0 fixpath  � m  ���� ��� � / * ;   d o   o l d = ` b a s e n a m e   " $ f i l e " ` ;   n e w = $ { o l d / / [   ) ] / } ;   n e w = $ { n e w / / [ ( ] / _ } ;   i f   [   - f   " $ f i l e "   ] ;   t h e n   m v   " $ f i l e "  � o  ������ 0 fixpath  � m  ���� ���  / $ n e w ;   f i ;   d o n e� o      ���� 0 	thescript  � ���� I ������
�� .sysoexecTEXT���     TEXT� o  ������ 0 	thescript  ��  ��  �� 0 fixpath  � o  ������ 0 fixpaths  � ��� l 		��������  ��  ��  � ��� r  	��� b  	��� m  	�� ���  r m d i r  � o  ���� 0 temppath tempPath� o      ���� 0 	thescript  � ���� I �����
�� .sysoexecTEXT���     TEXT� o  �� 0 	thescript  ��  ��  @ ��� l     �~�}�|�~  �}  �|  � ��� l     �{�z�y�{  �z  �y  � ��� i   ' *��� I      �x�w�v�x 0 
getlibpath 
getLibPath�w  �v  � k     \�� ��� O    ��� r    ��� n    ��� 1    �u
�u 
valL� n    ��� 4    �t�
�t 
plii� m    �� ���  L i b r a r y P a t h� 4    �s�
�s 
plif� l   ��r�q� b    �	 � l   	�p�o	 I   �n		
�n .earsffdralis        afdr	 m    �m
�m afdrpref	 �l	�k
�l 
rtyp	 m    	�j
�j 
utxt�k  �p  �o  	  m    		 �		 0 c o m . a p p l e . A p e r t u r e . p l i s t�r  �q  � o      �i�i 0 	p_libpath 	p_libPath� m     		�                                                                                  sevs  alis    �  
Subversion                 �1ubH+  QڔSystem Events.app                                              U����nV        ����  	                CoreServices    �1�      ���    QڔQڑQڐ  ;Subversion:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p   
 S u b v e r s i o n  -System/Library/CoreServices/System Events.app   / ��  � 				 l   �h�g�f�h  �g  �f  		 	
�e	
 Z    \		�d		 l   $	�c�b	 >   $			 l   "	�a�`	 I   "�_�^	
�_ .sysooffslong    ��� null�^  	 �]		
�] 
psof	 m    		 �		  ~	 �\	�[
�\ 
psin	 o    �Z�Z 0 	p_libpath 	p_libPath�[  �a  �`  	 m   " #�Y�Y  �c  �b  	 k   ' W		 			 r   ' *			 m   ' (		 �		  / b i n / e c h o   $ H O M E	 o      �X�X 0 p_script  	 		 	 r   + 2	!	"	! l  + 0	#�W�V	# I  + 0�U	$�T
�U .sysoexecTEXT���     TEXT	$ o   + ,�S�S 0 p_script  �T  �W  �V  	" o      �R�R 0 
p_homepath 
p_homePath	  	%	&	% l  3 3�Q�P�O�Q  �P  �O  	& 	'	(	' r   3 @	)	*	) I  3 >�N�M	+
�N .sysooffslong    ��� null�M  	+ �L	,	-
�L 
psof	, m   5 8	.	. �	/	/  ~	- �K	0�J
�K 
psin	0 o   9 :�I�I 0 	p_libpath 	p_libPath�J  	* o      �H�H 0 p_offset  	( 	1	2	1 r   A R	3	4	3 n   A P	5	6	5 7  B P�G	7	8
�G 
ctxt	7 l  H L	9�F�E	9 [   H L	:	;	: o   I J�D�D 0 p_offset  	; m   J K�C�C �F  �E  	8 m   M O�B�B��	6 o   A B�A�A 0 	p_libpath 	p_libPath	4 o      �@�@ 
0 p_path  	2 	<	=	< l  S S�?�>�=�?  �>  �=  	= 	>�<	> L   S W	?	? b   S V	@	A	@ o   S T�;�; 0 
p_homepath 
p_homePath	A o   T U�:�: 
0 p_path  �<  �d  	 L   Z \	B	B o   Z [�9�9 0 	p_libpath 	p_libPath�e  � 	C	D	C l     �8�7�6�8  �7  �6  	D 	E	F	E i   + .	G	H	G I      �5	I�4�5 ,0 monthtointegerstring monthToIntegerString	I 	J�3	J o      �2�2 0 mn mN�3  �4  	H Z    �	K	L	M	N	K G     	O	P	O G     	Q	R	Q G     	S	T	S l    	U�1�0	U =    	V	W	V o     �/�/ 0 mn mN	W m    	X	X �	Y	Y  J a n�1  �0  	T l   		Z�.�-	Z =   		[	\	[ o    �,�, 0 mn mN	\ m    	]	] �	^	^  j a n�.  �-  	R l   	_�+�*	_ =   	`	a	` o    �)�) 0 mn mN	a m    	b	b �	c	c  J a n u a r y�+  �*  	P l   	d�(�'	d =   	e	f	e o    �&�& 0 mn mN	f m    	g	g �	h	h  j a n u a r y�(  �'  	L L     	i	i m    	j	j �	k	k  0 1	M 	l	m	l G   # >	n	o	n G   # 6	p	q	p G   # .	r	s	r l  # &	t�%�$	t =  # &	u	v	u o   # $�#�# 0 mn mN	v m   $ %	w	w �	x	x  F e b�%  �$  	s l  ) ,	y�"�!	y =  ) ,	z	{	z o   ) *� �  0 mn mN	{ m   * +	|	| �	}	}  f e b�"  �!  	q l  1 4	~��	~ =  1 4		�	 o   1 2�� 0 mn mN	� m   2 3	�	� �	�	�  F e b r u a r y�  �  	o l  9 <	���	� =  9 <	�	�	� o   9 :�� 0 mn mN	� m   : ;	�	� �	�	�  f e b r u a r y�  �  	m 	�	�	� L   A C	�	� m   A B	�	� �	�	�  0 2	� 	�	�	� G   F a	�	�	� G   F Y	�	�	� G   F Q	�	�	� l  F I	���	� =  F I	�	�	� o   F G�� 0 mn mN	� m   G H	�	� �	�	�  M a r�  �  	� l  L O	���	� =  L O	�	�	� o   L M�� 0 mn mN	� m   M N	�	� �	�	�  m a r�  �  	� l  T W	���	� =  T W	�	�	� o   T U�� 0 mn mN	� m   U V	�	� �	�	� 
 M a r c h�  �  	� l  \ _	���	� =  \ _	�	�	� o   \ ]�� 0 mn mN	� m   ] ^	�	� �	�	� 
 m a r c h�  �  	� 	�	�	� L   d f	�	� m   d e	�	� �	�	�  0 3	� 	�	�	� G   i �	�	�	� G   i �	�	�	� G   i x	�	�	� l  i n	���	� =  i n	�	�	� o   i j�� 0 mn mN	� m   j m	�	� �	�	�  A p r�  �  	� l  q v	��
�		� =  q v	�	�	� o   q r�� 0 mn mN	� m   r u	�	� �	�	�  a p r�
  �	  	� l  { �	���	� =  { �	�	�	� o   { |�� 0 mn mN	� m   | 	�	� �	�	� 
 A p r i l�  �  	� l  � �	���	� =  � �	�	�	� o   � ��� 0 mn mN	� m   � �	�	� �	�	� 
 a p r i l�  �  	� 	�	�	� L   � �	�	� m   � �	�	� �	�	�  0 4	� 	�	�	� G   � �	�	�	� l  � �	��� 	� =  � �	�	�	� o   � ����� 0 mn mN	� m   � �	�	� �	�	�  M a y�  �   	� l  � �	�����	� =  � �	�	�	� o   � ����� 0 mn mN	� m   � �	�	� �	�	�  m a y��  ��  	� 	�	�	� L   � �	�	� m   � �	�	� �	�	�  0 5	� 	�	�	� G   � �	�	�	� G   � �	�	�	� G   � �	�	�	� l  � �	�����	� =  � �	�	�	� o   � ����� 0 mn mN	� m   � �	�	� �	�	�  J u n��  ��  	� l  � �	�����	� =  � �	�	�	� o   � ����� 0 mn mN	� m   � �	�	� �	�	�  j u n��  ��  	� l  � �	�����	� =  � �	�	�	� o   � ����� 0 mn mN	� m   � �	�	� �	�	�  J u n e��  ��  	� l  � �	�����	� =  � �	�	�	� o   � ����� 0 mn mN	� m   � �	�	� �	�	�  j u n e��  ��  	� 	�	�	� L   � �
 
  m   � �

 �

  0 6	� 


 G   � �


 G   � �


 G   � �
	


	 l  � �
����
 =  � �


 o   � ����� 0 mn mN
 m   � �

 �

  J u l��  ��  

 l  � �
����
 =  � �


 o   � ����� 0 mn mN
 m   � �

 �

  j u l��  ��  
 l  � �
����
 =  � �


 o   � ����� 0 mn mN
 m   � �

 �

  J u l y��  ��  
 l  � �
����
 =  � �


 o   � ����� 0 mn mN
 m   � �

 �

  j u l y��  ��  
 

 
 L  
!
! m  
"
" �
#
#  0 7
  
$
%
$ G  	,
&
'
& G  	"
(
)
( G  	
*
+
* l 	
,����
, = 	
-
.
- o  	
���� 0 mn mN
. m  

/
/ �
0
0  A u g��  ��  
+ l 
1����
1 = 
2
3
2 o  ���� 0 mn mN
3 m  
4
4 �
5
5  a u g��  ��  
) l  
6����
6 =  
7
8
7 o  ���� 0 mn mN
8 m  
9
9 �
:
:  A u g u s t��  ��  
' l %*
;����
; = %*
<
=
< o  %&���� 0 mn mN
= m  &)
>
> �
?
?  a u g u s t��  ��  
% 
@
A
@ L  /3
B
B m  /2
C
C �
D
D  0 8
A 
E
F
E G  6Y
G
H
G G  6O
I
J
I G  6E
K
L
K l 6;
M����
M = 6;
N
O
N o  67���� 0 mn mN
O m  7:
P
P �
Q
Q  S e p��  ��  
L l >C
R����
R = >C
S
T
S o  >?���� 0 mn mN
T m  ?B
U
U �
V
V  s e p��  ��  
J l HM
W����
W = HM
X
Y
X o  HI���� 0 mn mN
Y m  IL
Z
Z �
[
[  S e p t e m b e r��  ��  
H l RW
\����
\ = RW
]
^
] o  RS���� 0 mn mN
^ m  SV
_
_ �
`
`  s e p t e m b e r��  ��  
F 
a
b
a L  \`
c
c m  \_
d
d �
e
e  0 9
b 
f
g
f G  c�
h
i
h G  c|
j
k
j G  cr
l
m
l l ch
n����
n = ch
o
p
o o  cd���� 0 mn mN
p m  dg
q
q �
r
r  O c t��  ��  
m l kp
s����
s = kp
t
u
t o  kl���� 0 mn mN
u m  lo
v
v �
w
w  o c t��  ��  
k l uz
x����
x = uz
y
z
y o  uv���� 0 mn mN
z m  vy
{
{ �
|
|  O c t o b e r��  ��  
i l �
}����
} = �
~

~ o  ����� 0 mn mN
 m  ��
�
� �
�
�  o c t o b e r��  ��  
g 
�
�
� L  ��
�
� m  ��
�
� �
�
�  1 0
� 
�
�
� G  ��
�
�
� G  ��
�
�
� G  ��
�
�
� l ��
�����
� = ��
�
�
� o  ������ 0 mn mN
� m  ��
�
� �
�
�  N o v��  ��  
� l ��
�����
� = ��
�
�
� o  ������ 0 mn mN
� m  ��
�
� �
�
�  n o v��  ��  
� l ��
�����
� = ��
�
�
� o  ������ 0 mn mN
� m  ��
�
� �
�
�  N o v e m b e r��  ��  
� l ��
�����
� = ��
�
�
� o  ������ 0 mn mN
� m  ��
�
� �
�
�  n o v e m b e r��  ��  
� 
�
�
� L  ��
�
� m  ��
�
� �
�
�  1 1
� 
�
�
� G  ��
�
�
� G  ��
�
�
� G  ��
�
�
� l ��
�����
� = ��
�
�
� o  ������ 0 mn mN
� m  ��
�
� �
�
�  D e c��  ��  
� l ��
�����
� = ��
�
�
� o  ������ 0 mn mN
� m  ��
�
� �
�
�  d e c��  ��  
� l ��
�����
� = ��
�
�
� o  ������ 0 mn mN
� m  ��
�
� �
�
�  D e c e m b e r��  ��  
� l ��
�����
� = ��
�
�
� o  ������ 0 mn mN
� m  ��
�
� �
�
�  d e c e m b e r��  ��  
� 
���
� L  ��
�
� m  ��
�
� �
�
�  1 2��  	N L  ��
�
� o  ������ 0 mn mN	F 
�
�
� l     ��������  ��  ��  
� 
�
�
� i   / 2
�
�
� I      ��
����� 0 setdate  
� 
���
� o      ���� 0 
datestring  ��  ��  
� k     
�
� 
�
�
� l     ��
�
���  
� $ log "datestring " & datestring   
� �
�
� < l o g   " d a t e s t r i n g   "   &   d a t e s t r i n g
� 
���
� L     
�
� 4     ��
�
�� 
ldt 
� o    ���� 0 
datestring  ��  
� 
���
� l     ��������  ��  ��  ��  � ��
��
�
�
�
�
�
�
�
�
�
�
�
���  
� ���������������������������� 	0 p_sql  �� 0 
fileexists 
fileExists�� 0 folderexists  �� 0 monthtointeger  �� 0 monthtostring  �� 0 chooseproject chooseProject�� 0 
seturgency 
setUrgency�� "0 setexporteddate setExportedDate�� 0 addlinks addLinks�� 0 
exportpics 
exportPics�� 0 
getlibpath 
getLibPath�� ,0 monthtointegerstring monthToIntegerString�� 0 setdate  
� �������
�
����� 0 
fileexists 
fileExists�� ��
��� 
�  ���� 0 	posixpath 	posixPath��  
� ���� 0 	posixpath 	posixPath
� ��������~
�� 
strq
�� .sysoexecTEXT���     TEXT
� 
long
�~ 
bool�� ��,%�%j �&�&
� �}��|�{
�
��z�} 0 folderexists  �| �y
��y 
�  �x�w�x 0 
folderyear  �w 0 foldermonth  �{  
� �v�u�v 0 
folderyear  �u 0 foldermonth  
� ��t�s
�t 
rkfl
�s .coredoexnull���     ****�z 2� .*�/j  *�/ *�/j  eY fUY hOfU
� �r��q�p
�
��o�r 0 monthtointeger  �q �n
��n 
�  �m�m 0 monthstring  �p  
� �l�l 0 monthstring  
� �k���j�i
�k 
ldt 
�j 
mnth
�i 
long�o *��%�%/�,�&
� �h��g�f
�
��e�h 0 monthtostring  �g �d
��d 
�  �c�c 0 monthint  �f  
� �b�b 0 monthint  
� �a	�`�_
�a 
ldt 
�` 
mnth
�_ 
TEXT�e *��%�%/�,�&
� �^�]�\
�
��[�^ 0 chooseproject chooseProject�] �Z
��Z 
�  �Y�Y 0 adate aDate�\  
� �X�W�V�U�T�S�R�Q�P�O�N�X 0 adate aDate�W 0 curyear  �V 0 curmonth  �U 
0 curday  �T 0 curtime  �S 0 monthexists  �R 0 changemonthmessage  �Q 0 changeyearmessage  �P 0 choosenproject  �O 0 pr  �N 0 x  
� �M�L�K�J�I�HIO��G�F�E�D��C�B�A�
����
�M 
year
�L 
TEXT
�K 
mnth
�J 
day 
�I 
time�H 0 folderexists  
�G 
rkfl
�F 
rkpj
�E 
pnam
�D 
prmp
�C .gtqpchltns    @   @ ns  
�B 
rslt
�A 
cobj
�  �[��,�&E�O��,�&E�O��,�&E�O��,�&E�O*��l+  eE�Y fE�O�E�O�E�OfE�O�E�O� � �h�� 7*�/ ,*�/ $eE�O*�-�,EE�O��6FO���l O�a k/E�UUY hO��  0fE�O*�/ !*�-�,E�O��6FO��a l O�a k/E�UY hO��  =*�-�,a [[�,\Za @C\[�,\Za >A1E�O��a l O�a k/E�OfE�Y eE�[OY�EO�U
� �@��?�>
�
��=�@ 0 
seturgency 
setUrgency�? �<
��< 
�  �;�; 0 pr  �>  
� �:�: 0 pr  
� l�9�8
��7�6�5�4�3�2�1�0�/#&8;MPad
�9 
rkpj
�8 
rkdp
�7 
rkmr�6 
�5 
kocl
�4 
rkip
�3 
prdt
�2 
pnam
�1 
rkvl�0 
�/ .corecrel****      � null�= �� �*�/ �*�-�[�,\Z�81 *��������� UO*�-�[�,\Z�81 *������a �� UO*�-�[�,\Zm81 *����a �a �� UO*�-�[�,\Zl81 *����a �a �� UO*�-�[�,\Zk81 *����a �a �� UUU
� �.r�-�,
�
��+�. "0 setexporteddate setExportedDate�- �*
��* 
�  �)�) 0 selectedpics selectedPics�,  
� 
�(�'�&�%�$�#�"�!� ��( 0 selectedpics selectedPics�' 	0 edate  �& 0 curyear  �% 0 curmonth  �$ 
0 curday  �# 0 curhour  �" 0 curmins  �! 0 cursecs  �  0 exporteddate exportedDate� 0 pic  
� ���������������� ���������
� .misccurdldt    ��� null� 
� 
min 
� 
year
� 
TEXT
� 
mnth� ,0 monthtointegerstring monthToIntegerString
� 
day 
� 
leng
� 
hour
� 
scnd
� 
kocl
� 
cobj
� .corecnte****       ****
� 
rkip
� 
prdt
� 
pnam
� 
rkvl� 
� .corecrel****      � null�+ �*j  �� E�O��,�&E�O)*j  �,�&k+ E�O��,�&E�O��,k  
�%E�Y hO��,�&E�O��,k  
�%E�Y hO��,�&E�O��,k  
�%E�Y hO��,�&E�O��,k  
�%E�Y hO��%�%�%�%�%�%a %E�Oa  > ;�[a a l kh 	�  *a a a a a a �a a  U[OY��U
� �
%�	�
�
���
 0 addlinks addLinks�	 � �    ���
� 
sele� 0 	linkspath 	linksPath� 0 databasepath databasePath�  
� ��� ����������������������������
� 
sele� 0 	linkspath 	linksPath�  0 databasepath databasePath�� 0 	thescript  �� 0 theout theOut�� 
0 curimg  �� 0 isref isRef�� 0 curid curID�� 0 curname  �� 0 
mastername 
masterName�� 0 newline newLine�� 0 	zfileuuid 	ZFILEUUID�� 0 
zimagepath 
ZIMAGEPATH�� "0 zfilevolumeuuid ZFILEVOLUMEUUID�� 0 diskname diskName�� 0 imgpath imgPath�� 0 linkname linkName
�  ��B����:��������������n��z�����������#������ 0 
fileexists 
fileExists
�� .sysoexecTEXT���     TEXT
�� 
ret 
�� 
kocl
�� 
cobj
�� .corecnte****       ****
�� 
rkrd
�� 
ID  
�� 
pnam
�� 
rkot
�� 
rkvl
�� 
strq��  ��  �6)�k+   �%E�O�j Y hO�E�O��[��l kh ��,E�O��,E�O��,E�O���/�,E�O��%E�O�e  �b   ��,%a %�%a %E�O�j E�Ob   ��,%a %�%a %E�O�j E�Ob   ��,%a %�%a %E�O�j E�Ob   ��,%a %�%a %E�O�j E�Oa �%a %�%E�O�a %��,%E^ Oa ] %a %��,%a %] %E�O 
�j W X  hY hO��%E�O��%�%E�OP[OY� UO�
� ��B�������� 0 
exportpics 
exportPics�� ����   �������������� 0 selectedpics selectedPics�� 0 databasepath databasePath�� 0 	largepath 	largePath�� 0 	thumbpath 	thumbPath�� 0 
mediumpath 
mediumPath�� 0 fullsizepath fullsizePath��   ������������������������������ 0 selectedpics selectedPics�� 0 databasepath databasePath�� 0 	largepath 	largePath�� 0 	thumbpath 	thumbPath�� 0 
mediumpath 
mediumPath�� 0 fullsizepath fullsizePath�� 0 curyear  �� 0 curmonth  �� 
0 curday  �� 0 curtime  �� 0 temppath tempPath�� 0 	thescript  �� 0 fixpaths  �� 0 fixpath   6U�����������������������������������������+0;=LNZ_lnz������������������
�� .ascrcmnt****      � ****
�� .misccurdldt    ��� null
�� 
year
�� 
TEXT
�� 
mnth
�� 
day 
�� 
time
�� .sysoexecTEXT���     TEXT�� 0 
fileexists 
fileExists��
�� 
nmfi
�� 
rknp
�� 
faal
�� 
rkes
�� 
insh�� 
�� .rkstrkxpnull���     ****�� "0 setexporteddate setExportedDate�� 
�� 
kocl
�� 
cobj
�� .corecnte****       ****���%j O*j �,�&E�O*j �,�&E�O*j �,�&E�O*j �,�&E�O�%�%�%�%E�O�%E�O�j 
O)�k+  �j O�%E�O�j 
Y hO)�k+  ��%E�O�j 
Y hO)�k+  �%E�O�j 
Y hO)�k+  �%E�O�j 
Y hOa a n�a *a a /a *a a /a �a  Oa �%a %�%E�O�j 
O�a *a a /a *a a /a �a  Oa �%a  %E�O�j 
Oa !�%a "%�%E�O�j 
O�a *a a #/a *a a $/a �a  Oa %�%a &%�%E�O�j 
O�a *a a '/a *a a (/a �a  Oa )�%a *%E�O�j 
Oa +�%a ,%�%E�O�j 
oUO)�k+ -O����a .vE�O /�[a /a 0l 1kh a 2�%a 3%�%a 4%E�O�j 
[OY��Oa 5�%E�O�j 

� ����������� 0 
getlibpath 
getLibPath��  ��   ������������ 0 	p_libpath 	p_libPath�� 0 p_script  �� 0 
p_homepath 
p_homePath�� 0 p_offset  �� 
0 p_path   	����������	�������	������	��	.��
�� 
plif
�� afdrpref
�� 
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
ctxt�� ]� *����l �%/��/�,E�UO*���� j 5�E�O�j E�O*�a �� E�O�[a \[Z�k\Zi2E�O��%Y �
� ��	H�������� ,0 monthtointegerstring monthToIntegerString�� ����   ���� 0 mn mN��   ���� 0 mn mN ;	X	]��	b	g	j	w	|	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�





"
/
4
9
>
C
P
U
Z
_
d
q
v
{
�
�
�
�
�
�
�
�
�
�
�
�
�� 
bool����� 
 �� �&
 �� �&
 �� �& �Yˠ� 
 �� �&
 �� �&
 �� �& �Y��� 
 �� �&
 �� �&
 �� �& �Y��a  
 	�a  �&
 	�a  �&
 	�a  �& 	a YX�a  
 	�a  �& 	a Y?�a  
 	�a  �&
 	�a  �&
 	�a  �& 	a Y�a  
 	�a  �&
 	�a  �&
 	�a   �& 	a !Y �a " 
 	�a # �&
 	�a $ �&
 	�a % �& 	a &Y ��a ' 
 	�a ( �&
 	�a ) �&
 	�a * �& 	a +Y ��a , 
 	�a - �&
 	�a . �&
 	�a / �& 	a 0Y ^�a 1 
 	�a 2 �&
 	�a 3 �&
 	�a 4 �& 	a 5Y 1�a 6 
 	�a 7 �&
 	�a 8 �&
 	�a 9 �& 	a :Y �
� ��
�����	
���� 0 setdate  �� ����   ���� 0 
datestring  ��  	 ���� 0 
datestring  
 ��
�� 
ldt �� *�/ES � ^ / U s e r s / i a i n / P i c t u r e s / A p e r t u r e   L i b r a r y . a p l i b r a r yT �  
�� boovfalsU � ^ / U s e r s / i a i n / P i c t u r e s / A p e r t u r e   L i b r a r y . a p l i b r a r yV � � / U s e r s / i a i n / P i c t u r e s / A p e r t u r e   L i b r a r y . a p l i b r a r y / D a t a b a s e / L i b r a r y . a p d bW �  2 7X � 
 5 8 1 8 5
�� boovtrue
�� boovtrueY �  0 4 - O W CZ ����     !"# ������������������������������ �$$  0 1 - D 2 0 0 - 1 0 5 �%%  0 1 - T r y - D i v e �&&  0 4 - O W C �''  0 4 - M a c r o - D 2 0 0 �((  0 4 - M o d e l �))  0 9 - S c h o o l - T r i p �**  1 4 - M o s q u i t o �++  1 5 - D e b b i e s - d e e p �,, $ 1 5 - H y p e r a c t i v e - A O W �-- & 1 7 - L i o n f i s h - s e l f i e s �.. 4 1 8 - B l a c k - I n f i n i t y - R e d - M o o n �//  1 9 - S h a r k s  �00  2 0 - N i g h t! �11  2 3 - S l e e p l e s s" �22  2 3 - D i s c o d o r i s# �33 $ 3 0 - P o r t r a i t - F o r m a t��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  �  [ �44  0 4\ �55  2 0 1 4 / 0 4 / 0 4 - O W C] �66 l / U s e r s / i a i n / P i c t u r e s / P u b l i s h e d / f u l l s i z e / 2 0 1 4 / 0 4 / 0 4 - O W C^ �77 f / U s e r s / i a i n / P i c t u r e s / P u b l i s h e d / l a r g e / 2 0 1 4 / 0 4 / 0 4 - O W C_ �88 j / U s e r s / i a i n / P i c t u r e s / P u b l i s h e d / m a s t e r s / 2 0 1 4 / 0 4 / 0 4 - O W C` �99 h / U s e r s / i a i n / P i c t u r e s / P u b l i s h e d / t h u m b s / 2 0 1 4 / 0 4 / 0 4 - O W Ca �:: h / U s e r s / i a i n / P i c t u r e s / P u b l i s h e d / m e d i u m / 2 0 1 4 / 0 4 / 0 4 - O W Cb �;; Z / U s e r s / i a i n / P i c t u r e s / P u b l i s h e d / 2 0 1 4 / 0 4 / 0 4 - O W Cc �<<� m k d i r   - p   / U s e r s / i a i n / P i c t u r e s / P u b l i s h e d / t h u m b s / 2 0 1 4 / 0 4 / 0 4 - O W C ;   m k d i r   - p   / U s e r s / i a i n / P i c t u r e s / P u b l i s h e d / m e d i u m / 2 0 1 4 / 0 4 / 0 4 - O W C ;   m k d i r   - p   / U s e r s / i a i n / P i c t u r e s / P u b l i s h e d / m a s t e r s / 2 0 1 4 / 0 4 / 0 4 - O W C ;   m k d i r   - p   / U s e r s / i a i n / P i c t u r e s / P u b l i s h e d / f u l l s i z e / 2 0 1 4 / 0 4 / 0 4 - O W C ;   m k d i r   - p   / U s e r s / i a i n / P i c t u r e s / P u b l i s h e d / 2 0 1 4 / 0 4 / 0 4 - O W C ;   m k d i r   - p   / U s e r s / i a i n / P i c t u r e s / P u b l i s h e d / l a r g e / 2 0 1 4 / 0 4 / 0 4 - O W Cd �==  e �~>�~ >  ?@ABCDEFGHIJKLMNOPQ? RR S�}T�|S g�{U�z
�{ 
rkpjU �VV , 0 7 R m j H h L R T q 4 r M C z X w i g Q Q
�z kfrmID  
�} 
rkdpT �WW , P b Z Q 3 Y W R Q k m 6 M l a P e j m R i A
�| kfrmID  @ XX Y�yZ�xY g�w[�v
�w 
rkpj[ �\\ , 0 7 R m j H h L R T q 4 r M C z X w i g Q Q
�v kfrmID  
�y 
rkdpZ �]] , N e 9 q H N y v S 1 G Y 3 Q j q a O y J C A
�x kfrmID  A ^^ _�u`�t_ g�sa�r
�s 
rkpja �bb , 0 7 R m j H h L R T q 4 r M C z X w i g Q Q
�r kfrmID  
�u 
rkdp` �cc , g C 5 g C g P e S E a a G F c 3 A o 1 5 P w
�t kfrmID  B dd e�qf�pe g�og�n
�o 
rkpjg �hh , 0 7 R m j H h L R T q 4 r M C z X w i g Q Q
�n kfrmID  
�q 
rkdpf �ii , g H k I 2 u % Y T D y I e 1 + o w y e o 7 A
�p kfrmID  C jj k�ml�lk g�km�j
�k 
rkpjm �nn , 0 7 R m j H h L R T q 4 r M C z X w i g Q Q
�j kfrmID  
�m 
rkdpl �oo , G r D I P 0 K T Q x K O 8 z G Q j 7 2 X l g
�l kfrmID  D pp q�ir�hq g�gs�f
�g 
rkpjs �tt , 0 7 R m j H h L R T q 4 r M C z X w i g Q Q
�f kfrmID  
�i 
rkdpr �uu , H L c e w u z G R M a W o a + g R f q S 8 w
�h kfrmID  E vv w�ex�dw g�cy�b
�c 
rkpjy �zz , 0 7 R m j H h L R T q 4 r M C z X w i g Q Q
�b kfrmID  
�e 
rkdpx �{{ , y P w o E w R J S a 2 X B t 2 T X F i g x A
�d kfrmID  F || }�a~�`} g�_�^
�_ 
rkpj ��� , 0 7 R m j H h L R T q 4 r M C z X w i g Q Q
�^ kfrmID  
�a 
rkdp~ ��� , l X s K G u k R R V + T N l v m B l Q H P w
�` kfrmID  G �� ��]��\� g�[��Z
�[ 
rkpj� ��� , 0 7 R m j H h L R T q 4 r M C z X w i g Q Q
�Z kfrmID  
�] 
rkdp� ��� , W v Z F 9 g N i Q Q a e r e z X Y w 9 o n g
�\ kfrmID  H �� ��Y��X� g�W��V
�W 
rkpj� ��� , 0 7 R m j H h L R T q 4 r M C z X w i g Q Q
�V kfrmID  
�Y 
rkdp� ��� , E 3 n 8 q f n j Q A y Y W P 0 g n s t J M g
�X kfrmID  I �� ��U��T� g�S��R
�S 
rkpj� ��� , 0 7 R m j H h L R T q 4 r M C z X w i g Q Q
�R kfrmID  
�U 
rkdp� ��� , U I J 2 i 1 6 x T k e e + X v Z U m n a V g
�T kfrmID  J �� ��Q��P� g�O��N
�O 
rkpj� ��� , 0 7 R m j H h L R T q 4 r M C z X w i g Q Q
�N kfrmID  
�Q 
rkdp� ��� , l j 1 2 L I Y l R G O + 4 U z J b f N % m A
�P kfrmID  K �� ��M��L� g�K��J
�K 
rkpj� ��� , 0 7 R m j H h L R T q 4 r M C z X w i g Q Q
�J kfrmID  
�M 
rkdp� ��� , s Y 2 M m c c h Q L m p Q q % Q R 1 l u w w
�L kfrmID  L �� ��I��H� g�G��F
�G 
rkpj� ��� , 0 7 R m j H h L R T q 4 r M C z X w i g Q Q
�F kfrmID  
�I 
rkdp� ��� , P 1 x J p 9 q f R n m e c i 3 0 k 4 J B 5 w
�H kfrmID  M �� ��E��D� g�C��B
�C 
rkpj� ��� , 0 7 R m j H h L R T q 4 r M C z X w i g Q Q
�B kfrmID  
�E 
rkdp� ��� , o f h v T S X m R e m N N 1 O c I b t + O g
�D kfrmID  N �� ��A��@� g�?��>
�? 
rkpj� ��� , 0 7 R m j H h L R T q 4 r M C z X w i g Q Q
�> kfrmID  
�A 
rkdp� ��� , 4 h p u V % 9 U S U e B E 0 Q e W + 3 % b g
�@ kfrmID  O �� ��=��<� g�;��:
�; 
rkpj� ��� , 0 7 R m j H h L R T q 4 r M C z X w i g Q Q
�: kfrmID  
�= 
rkdp� ��� , + l h + O W u X T + C x R V c f I m X I l Q
�< kfrmID  P �� ��9��8� g�7��6
�7 
rkpj� ��� , 0 7 R m j H h L R T q 4 r M C z X w i g Q Q
�6 kfrmID  
�9 
rkdp� ��� , k f W g e Y L D R L + 9 4 P m K Y K u a c Q
�8 kfrmID  Q �� ��5��4� g�3��2
�3 
rkpj� ��� , 0 7 R m j H h L R T q 4 r M C z X w i g Q Q
�2 kfrmID  
�5 
rkdp� ��� , F n i G Y % W I R b u 2 4 B D O u D G 9 t w
�4 kfrmID  ��   ascr  ��ޭ