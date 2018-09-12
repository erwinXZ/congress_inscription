PGDMP     ,                    v            congress_inscription    10.4 (Debian 10.4-2)    10.4 (Debian 10.4-2) &    l           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            m           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            n           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            o           1262    16384    congress_inscription    DATABASE     �   CREATE DATABASE congress_inscription WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'es_ES.UTF-8' LC_CTYPE = 'es_ES.UTF-8';
 $   DROP DATABASE congress_inscription;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            p           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    13007    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            q           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    16427    logs_accesses    TABLE       CREATE TABLE public.logs_accesses (
    id integer NOT NULL,
    ip character varying(15) NOT NULL,
    income_date timestamp without time zone NOT NULL,
    departure_date timestamp without time zone,
    additional_data text,
    user_id integer NOT NULL
);
 !   DROP TABLE public.logs_accesses;
       public         postgres    false    3            �            1259    16425    logs_accesses_id_seq    SEQUENCE     �   CREATE SEQUENCE public.logs_accesses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.logs_accesses_id_seq;
       public       postgres    false    3    201            r           0    0    logs_accesses_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.logs_accesses_id_seq OWNED BY public.logs_accesses.id;
            public       postgres    false    200            �            1259    16492    participants    TABLE     �  CREATE TABLE public.participants (
    id integer NOT NULL,
    name character varying(180) NOT NULL,
    document character varying(15),
    email character varying(90),
    mobile numeric(8,0),
    city character varying(60),
    country character varying(30),
    occupation character varying(180),
    university character varying(180),
    career character varying(180),
    materials character(1) DEFAULT 'N'::bpchar,
    type character(1) DEFAULT 'S'::bpchar,
    printed character(1) DEFAULT 'N'::bpchar,
    status character(1) DEFAULT 'A'::bpchar,
    created timestamp without time zone NOT NULL,
    modified timestamp without time zone,
    created_by integer NOT NULL,
    modified_by integer
);
     DROP TABLE public.participants;
       public         postgres    false    3            �            1259    16490    participants_id_seq    SEQUENCE     �   CREATE SEQUENCE public.participants_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.participants_id_seq;
       public       postgres    false    3    203            s           0    0    participants_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.participants_id_seq OWNED BY public.participants.id;
            public       postgres    false    202            �            1259    16387    roles    TABLE     #  CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    status character(1) DEFAULT 'A'::bpchar,
    created timestamp without time zone NOT NULL,
    modified timestamp without time zone,
    created_by integer NOT NULL,
    modified_by integer
);
    DROP TABLE public.roles;
       public         postgres    false    3            �            1259    16385    roles_id_seq    SEQUENCE     �   CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.roles_id_seq;
       public       postgres    false    3    197            t           0    0    roles_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;
            public       postgres    false    196            �            1259    16396    users    TABLE     2  CREATE TABLE public.users (
    id integer NOT NULL,
    document character varying(30) NOT NULL,
    firstname character varying(60) NOT NULL,
    lastname character varying(60) NOT NULL,
    username character varying(30) NOT NULL,
    password character varying(60) NOT NULL,
    email character varying(60),
    address character varying(60),
    mobile character varying(15),
    phone character varying(15),
    last_access timestamp without time zone,
    last_ip character varying(15),
    last_change_password timestamp without time zone,
    remember_token character varying(100),
    status character(1) DEFAULT 'A'::bpchar,
    created timestamp without time zone NOT NULL,
    modified timestamp without time zone,
    created_by integer NOT NULL,
    modified_by integer,
    role_id integer NOT NULL
);
    DROP TABLE public.users;
       public         postgres    false    3            �            1259    16394    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public       postgres    false    199    3            u           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
            public       postgres    false    198            �
           2604    16430    logs_accesses id    DEFAULT     t   ALTER TABLE ONLY public.logs_accesses ALTER COLUMN id SET DEFAULT nextval('public.logs_accesses_id_seq'::regclass);
 ?   ALTER TABLE public.logs_accesses ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    200    201    201            �
           2604    16495    participants id    DEFAULT     r   ALTER TABLE ONLY public.participants ALTER COLUMN id SET DEFAULT nextval('public.participants_id_seq'::regclass);
 >   ALTER TABLE public.participants ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    202    203    203            �
           2604    16390    roles id    DEFAULT     d   ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);
 7   ALTER TABLE public.roles ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    196    197    197            �
           2604    16399    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    198    199    199            g          0    16427    logs_accesses 
   TABLE DATA               f   COPY public.logs_accesses (id, ip, income_date, departure_date, additional_data, user_id) FROM stdin;
    public       postgres    false    201   �-       i          0    16492    participants 
   TABLE DATA               �   COPY public.participants (id, name, document, email, mobile, city, country, occupation, university, career, materials, type, printed, status, created, modified, created_by, modified_by) FROM stdin;
    public       postgres    false    203   �-       c          0    16387    roles 
   TABLE DATA               ]   COPY public.roles (id, name, status, created, modified, created_by, modified_by) FROM stdin;
    public       postgres    false    197   �H       e          0    16396    users 
   TABLE DATA               �   COPY public.users (id, document, firstname, lastname, username, password, email, address, mobile, phone, last_access, last_ip, last_change_password, remember_token, status, created, modified, created_by, modified_by, role_id) FROM stdin;
    public       postgres    false    199   �H       v           0    0    logs_accesses_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.logs_accesses_id_seq', 1, false);
            public       postgres    false    200            w           0    0    participants_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.participants_id_seq', 398, true);
            public       postgres    false    202            x           0    0    roles_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.roles_id_seq', 1, false);
            public       postgres    false    196            y           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 2, true);
            public       postgres    false    198            �
           2606    16435     logs_accesses logs_accesses_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.logs_accesses
    ADD CONSTRAINT logs_accesses_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.logs_accesses DROP CONSTRAINT logs_accesses_pkey;
       public         postgres    false    201            �
           2606    16504    participants participants_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.participants
    ADD CONSTRAINT participants_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.participants DROP CONSTRAINT participants_pkey;
       public         postgres    false    203            �
           2606    16393    roles roles_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public         postgres    false    197            �
           2606    16405    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public         postgres    false    199            �
           2606    16436 (   logs_accesses logs_accesses_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.logs_accesses
    ADD CONSTRAINT logs_accesses_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 R   ALTER TABLE ONLY public.logs_accesses DROP CONSTRAINT logs_accesses_user_id_fkey;
       public       postgres    false    201    199    2786            �
           2606    16406    users users_role_id_fkey    FK CONSTRAINT     w   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(id);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_role_id_fkey;
       public       postgres    false    197    199    2784            g      x������ � �      i      x��]ێ�F�}N`�_�-���b7�,�RR��nx+w-i���<_�ߠ�yaU��`[H���'"ND���U;t�Z��w�zu��T�rS!|�'������AH�A���KxAx�7~��,L�4�G�M����??b+�Z��[+<b���Fz��jG5\��������(�f�ZO6�N�}�5�Xʶ�v��J�'ĉ��(�Ʈ�n{��7u�r���0�u�}Xp��a���aP}�Gٮ{�5
9H|����|�T4jh^/-�f��+��ԑ��83��ESո�T�e[Ko�����Z�]�}Pz��A���tX3�m���b_� N�J�N��ھ�yR�J���ʍ�ޒ��j�sQM�(����1�-֣����J4��Jݫޫ��V=-�Z	].2+Y�M�y{���pdz,��"��[	Y^�%�\�f����$�Ǿ�o/�J��LŠ�
_~K�U-����u�ܺ������%�q8�m�3�wݠ���-,���I��d9��/`����~dK�Kܫ�H���U}����[~oC����04�����dի5C\4�K�����@�~�����S�%�FIG�48D;�����a"z9���
.δ)%v��&���L�-9滍l�f�C%�	��\p&�� �=����#6��۴��� ����+kr�ب�k t�ыr�VV����i�C�b�[�$w]_):D�yۮ�?��g��WMM��켚���}�����a����?��7ŭl�����l�G��nh�aI��Ɩ,��\5�[2zmw�t��n����'Y��GI�	�\d*����#`ဣy���΄ՙC�A��n��|�?����f��2޳��h���h{G��ēWZ.:!�w��(5
����nPXK����� [C�Fr�H�@�Jb��$ ��9);�q ˅&�j|0L�����W��Sh$IM�h�H]�Y2/�U0 G��g��n��g��Nrc��6A�a*G6).+7�W��f������H�tKAS����X��Rq��@�j�?�U�,�1�)���Q}Wn:9���"# �;	HNُ^B��?��K���b�t[9h`��D��&M�lb6ꤤ}=:˥��T�Yhˍ������8��Q�V�e�b��u��Ѷ�rS͊�?��;�8�l��LxS \���25�#����~?��.�~�9��V:x,�}Q&�h�=����񂱀�,�!M�K�"&�l��՚4!����z����O-�Kr�����k6
ۂ��ԽX��dV�݄D�?�� I��I�[�Ѫ<�^I�a��摠|�z�&�A�u�|}�X�䃬�nw��2�8�ߗfl���l<Q����tP).�F�m���x+���A�"�xj<���$��N�˝s�o6������CO��9��I=@� �#^s�J~ΨH���P���]Q��鱊�$�GfV��_��r]A�[K�ww@j(�5R�p*z�P�i���9	M�`I�ªa'����E���nv�F�� }�~|y���]c���;�h�Ő�Fx���Ô�pf�:m%��~�[O���Cg
N<|�𻵂�v�(.UgFEˡ�������rM:�i�:y4H
�|>.����\��8s��tiuY�z���r5�U|q�QQQ�F
��X� İ�)�]��N�K��ac���p<��i��-Chե��WP�f����+d�� �H��ή�RѺ��� �*��USQ�`l%Cd&Z��M�t=�9j�ڮS�9�=�Ʌ���U-[��n:y ,��ڨz�R��?x����ޝ�����@�}= ����6��W�1[�B<>{O�ay���Ktt:q[�3�):p�k�h�2*(�V���t#េ
��מa��O�'ӡfHL)����׃�O�+$0$g��J'�\�C
�*��Q�SV�Zs�d�(�ȐY��6X�Va�"�"ކ(+#\��e�H�h� ����=�G�����m��vs��=u'���FN�CE�`l�b|��H,ٔ&����Q<)���2T��o96;�W�ej˾szYap�1��CO\�[fr!�uXr�iw�����S��%�ZX��B��
�����:c����una"Ή�Q7�jg��L����h�V%M�f��'�ZN�=�#�T�<�eH���,�S�W��'sL���6Gf����N���&י�;Ԏ3qb9R��#
��%�4Ы�֮�e� .D��x����֚�9��,Lx���q8H:	"�����y�40��iS�Aԫ��?:q#HC��8�]�\cR�`[w�+K|�-��:y#��s�4>��ܺ�+Cd"�nЯ���a�TqV6�5�i�(Yu踤� ̈́�&�j� DGf(*~m�����i<�d�o=�7��ǩ��#c2_| �>h4 pl@m�ڪ�elTF��J��wC-W��-G`(6��{"<�`��E� �Es�l�*��li�e݁� ��T�H�f�I
� ��C�m;r|\ß�6!l��,�xM��H�T]��\մS�"�2Ϧf���SSd��c�B�C�DtJ�9������h辍#@RH���+�¥�]
�Xnv5�.�R��7(V)#��Z��<)����0��<v�b�'���\� Oľ.�E��0ݮ����fr�D�������8�g���>b����0i˷��b���[�A�jx��l��!9����Z��K����]���X����ĠV��MϮ%�0�e(���K��x����"#�@�0$6[�k�e'i�Ԥg�����	��nkN�O��ݾ���_`�W����0%[��0yu����A���5�я˿E�g�����R�z.�s��!>�����7W���1��T�UvV�$�)OA����]#�	�hB�!t&�4{O ���b	��2�&<��_�x}�%�iI��!��f�u9���/���ܣ�-��)�L���e�\u�Hzv �ft�V*�2Nl�QD�f� ��Nnwd��C���Ad肽1P��ύ�� 1��V5�[u'둳a����i�8t^��e z΢f�J��49'vE<���|�����8����v���0��N���t��(�!E)XE+�(w���ؾn`|v����O�F-Syd��N����db5�!�&�ꪕdWz9TS}�PƲ�x�0��>T��2�e��X����w���r��r�y�T���h����;�?$����P���
�x�����~6�n������8W�m���]&>��p�tm�u�w=��p�������[�O=��#k�Û�I�D���֏�m�Fw�6�FD�]NL�������yc�ӡ�&��7��#��uhѾ�U٭�\v���f<Df�a)acs�]���UDI�{��b�y��(�f��(vpC>W��˰�
���`�8{VNyJ\��n�%��Vj��r��!��ς` wBؼv�0�aA(�����t�v&y�\fl�tN6�� p�a����
Z�Ȟ�wƱp�JJ��� {�c���8��Џ�ӝ��D�!/h�{�X�� /I�UY�@�(u�F�^1?~�Q�DL�fg¸�Y��������ߜ"[��r{j�-�b����i�q�#�,����H���s������(؄Id�K8���90���Yؤ�̔�4��v@B&/f�Xɉ8PI�;��ĀK�3���K�CMe7�5��q����S�oJ��N�p&�8Lt���Lg�i��I}!:�G�?K5~�H�@�~�5��<�Ӵ�����¤���<�d؎��bl�{]I���H9����(M��9/��jb�2�Y
��w�S�
��q��ɺ���o��`�i��@����S8���s;�;�w)2��s�!4��.a9�D�3c)���;I�Zͻ�7/�YD�N[#��V��v�De�$]���>��r;��bi����<O]��	������0�B3K=Y-ÑxG��Pj.��V���[v��
q0M��cڬ/��gq���M���T��z�B����#,��� �
  Vu��F�X(1DxY�����Å�\�!��.Q˦�ry���B��pCq*�W	at��[��������u�y�ޅ���|�q��{3�p��L��UMXx�ZJߍ'�P\nܺi�4v����P^!�i�4�Nܱq��ٲ]�\��^���7� �s�_����)م�h�e{��m�j{0/MKWgm%J�D� _���e����8��X~Z�~KM��&��Nu��z�7�.�zGjX�%K�YJ�r�J�İ���27:[K;�����.�Is=g&~CYl��s�څ��9R�.>P�4����~�f��g��l�۲*�Iln��F��3&4p�_���h%�;Ex�H{z���,Ⱥ��bf�9$����B;�z\�a�Ty74�M݅�#JΏ���i�ύ����J��S�5)�M�����{�8�a��d�0���.;����X�����&L�oz�/Z�U��c*OX����p�B��O4�A�ʝz��Y2��<	�6��v9ފ��,.Y"m 0U[9\��@���sm���S�+�"��C.�.׺]�^#����G�T�s�Rw���yOH�a��;�i�U����T��ҹpۤ4�Q�.�!rWxD&�7.i���;��-?Ozn��$w]�����'�pfa�F������hZ����|���<��	,3�F���k��LO����x�7�w�b;E��p}j�NE�!�+<!�k"]����xڀ�4��
I�Pz8�I�Z���~w�'d���*s�����,O~�X����=��'�f|x�� ��������@�:�� �	N�LӪJ)Go��<�v�ܶnȱ[�t5�D�x��&E!d����	Ql�0�MW6�t^�����T��Z���0pr��k�k��ǹO���d�W�9�ԩO�T;�~��=�r��V͍�[�@v�z���E
&yDd���>��gF��������e�P�4��x���Qyvn��B7��6؆�쑦\c���Q����]���L�w79�̗�����#�vF@�=�pS���4MuƑ�I�ܔ�Ҧ7�d�d���
�b۵tׁi*�@#�esKJZn���8O����fm�dg���}#��to�yWO4B8I뽖R ӱ����o��
��ع+�Ns�x�#�GG~L�"��z��m��ɩݏ��S2(�6�8��pu�#.:�zr�_��=����.��q��?���D�����i�J#Z�"�HB���M�Pd�~��U�����r#�'�������O���;.��}K�@FJ�I����E'D&L{ܞ�Ս,%��)�,��RюrG4�i��ܫ���zp�L��O|������<���^�y����뛔х������z~��r.���6�J�y����'�ۿ��O�ק?�����__D�iD	E�YN�a+�5������Ӄ��7<}�����g<���g��?<C�����ˣW>|����/�_?{ۯ�����%A��Y�i�W}>B��/^���'|������>|}}��>�ZZ���~�L^�ѡ�|����}���Dm��^����ç�'i\d��"�����H������_^��������������ק���� .�Ȃ ��(���a1^�?>=<㳟__��^�������O"���l���4/�Ŀ�Q>~~x������������?h˳�rE��	°�NE��������P{���˧_E`����y��u�᡿?���>�k�~��-��D��)|���zt��������ˬ����_�	� �Q������z�H������'mtn�/��%��C�uas��^�esؿ�-��4rZ���0�ФW��Y�o7�yT�og��~-�ӻ�$�^5؞�%�����wKx��#�^�s3h(aD��^T�A�ˤ&n�IG�N���~�=��<��N�5���.i���~l��@[{��
⃪��!��C�rG#��Ci��r�5��xA>_����+�\�'�����������=�w�2��I�e3�hV=�><����P�[5Q���4Fq��^�Hpn��]�b�ef^\S��=�Շv3��ߴ�[K�Հ���C[u9�'0Mu�)�t���N�(�t|dO���ܯ`�|sre�����n+k�	�$�����}mr"L32�N:���a��(��_f�ن��4�Ε��_�������I ���Yyg��˩W�>����Q�&�Ic?��.NbQ����o��2l�yX�;����ؑu�5�`�1�[6��f%vr�L�N7��:k�{B��A��=���!�I!`o�v��E�����F���ٯ�ȷ�Aǅf���2i�s$j���� ؑߙ�,�x��K��c���qf����r����t8D|G����͉�o'�(YCe��!>m�pz��1'8$^Զq�a�?F�%]\g�J�r�]'��k��h��+���9�����q}��z_ز�wm�'�T��3�k�.,%����|��4�J瘗�,�i��2�˄�.��ZӅ��:Ժ�c��r���r�Tjx~���ܑ
m�E�[�F4�ú^�.�U&7����|��k��v!�-v�;Y�9�V�
,�'�n�{w��i�`���d;��J�,}�ՙ���JM��.��!�0tܶ��V5+D1�c�eZn��~�����*���������ן~��� �R*C      c   P   x�3�tL����,.)JL�/�t�420��5��54P04�2��24�367276���\F��E�)�yə�9�������� �.m      e   M  x�m��n�0��ӧ��dq���A�Xa�&�&n
�P�T�F��k��m�eɿ���(!������h��D�(N���Ъ��mQ�p9�������G�y�g�pQWwO�����0�y�������2�"����?�~��&��"C#������� ��>	$A��쒠���<��DP\b�Ô������$q�*(�Tx��I���#�5'F�I��2��@��Q��HJ���U�A���a���ds��h�O��j��,8,������[�M���ֵ��r)�0o�4�ns���u�"5y�8��������"��)7i��PD�Ծ7��Ǝ�|�p}a     