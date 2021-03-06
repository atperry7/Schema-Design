PGDMP         9                u           postgres    9.6.2    9.6.2 "    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            	            2615    16593    peoplelocations    SCHEMA        CREATE SCHEMA peoplelocations;
    DROP SCHEMA peoplelocations;
             postgres    false            �            1259    16623    interest    TABLE     K   CREATE TABLE interest (
    id bigint NOT NULL,
    title text NOT NULL
);
 %   DROP TABLE peoplelocations.interest;
       peoplelocations         postgres    false    9            �            1259    16621    interest_id_seq    SEQUENCE     q   CREATE SEQUENCE interest_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE peoplelocations.interest_id_seq;
       peoplelocations       postgres    false    201    9            �           0    0    interest_id_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE interest_id_seq OWNED BY interest.id;
            peoplelocations       postgres    false    200            �            1259    16596    location    TABLE     ~   CREATE TABLE location (
    id bigint NOT NULL,
    city text NOT NULL,
    state text NOT NULL,
    country text NOT NULL
);
 %   DROP TABLE peoplelocations.location;
       peoplelocations         postgres    false    9            �            1259    16594    location_id_seq    SEQUENCE     q   CREATE SEQUENCE location_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE peoplelocations.location_id_seq;
       peoplelocations       postgres    false    197    9            �           0    0    location_id_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE location_id_seq OWNED BY location.id;
            peoplelocations       postgres    false    196            �            1259    16607    person    TABLE     �   CREATE TABLE person (
    id bigint NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL,
    age bigint NOT NULL,
    location bigint NOT NULL
);
 #   DROP TABLE peoplelocations.person;
       peoplelocations         postgres    false    9            �            1259    16605    person_id_seq    SEQUENCE     o   CREATE SEQUENCE person_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE peoplelocations.person_id_seq;
       peoplelocations       postgres    false    9    199            �           0    0    person_id_seq    SEQUENCE OWNED BY     1   ALTER SEQUENCE person_id_seq OWNED BY person.id;
            peoplelocations       postgres    false    198            �            1259    16634    person_interest    TABLE     y   CREATE TABLE person_interest (
    id bigint NOT NULL,
    person_id bigint NOT NULL,
    interest_id bigint NOT NULL
);
 ,   DROP TABLE peoplelocations.person_interest;
       peoplelocations         postgres    false    9            �            1259    16632    person_interest_id_seq    SEQUENCE     x   CREATE SEQUENCE person_interest_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE peoplelocations.person_interest_id_seq;
       peoplelocations       postgres    false    203    9            �           0    0    person_interest_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE person_interest_id_seq OWNED BY person_interest.id;
            peoplelocations       postgres    false    202                       2604    16626    interest id    DEFAULT     \   ALTER TABLE ONLY interest ALTER COLUMN id SET DEFAULT nextval('interest_id_seq'::regclass);
 C   ALTER TABLE peoplelocations.interest ALTER COLUMN id DROP DEFAULT;
       peoplelocations       postgres    false    200    201    201            �           2604    16599    location id    DEFAULT     \   ALTER TABLE ONLY location ALTER COLUMN id SET DEFAULT nextval('location_id_seq'::regclass);
 C   ALTER TABLE peoplelocations.location ALTER COLUMN id DROP DEFAULT;
       peoplelocations       postgres    false    196    197    197                        2604    16610 	   person id    DEFAULT     X   ALTER TABLE ONLY person ALTER COLUMN id SET DEFAULT nextval('person_id_seq'::regclass);
 A   ALTER TABLE peoplelocations.person ALTER COLUMN id DROP DEFAULT;
       peoplelocations       postgres    false    199    198    199                       2604    16637    person_interest id    DEFAULT     j   ALTER TABLE ONLY person_interest ALTER COLUMN id SET DEFAULT nextval('person_interest_id_seq'::regclass);
 J   ALTER TABLE peoplelocations.person_interest ALTER COLUMN id DROP DEFAULT;
       peoplelocations       postgres    false    203    202    203            �          0    16623    interest 
   TABLE DATA               &   COPY interest (id, title) FROM stdin;
    peoplelocations       postgres    false    201   �#       �           0    0    interest_id_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('interest_id_seq', 2, true);
            peoplelocations       postgres    false    200            �          0    16596    location 
   TABLE DATA               5   COPY location (id, city, state, country) FROM stdin;
    peoplelocations       postgres    false    197   ,$       �           0    0    location_id_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('location_id_seq', 2, true);
            peoplelocations       postgres    false    196            �          0    16607    person 
   TABLE DATA               C   COPY person (id, first_name, last_name, age, location) FROM stdin;
    peoplelocations       postgres    false    199   o$       �           0    0    person_id_seq    SEQUENCE SET     4   SELECT pg_catalog.setval('person_id_seq', 2, true);
            peoplelocations       postgres    false    198            �          0    16634    person_interest 
   TABLE DATA               >   COPY person_interest (id, person_id, interest_id) FROM stdin;
    peoplelocations       postgres    false    203   �$       �           0    0    person_interest_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('person_interest_id_seq', 3, true);
            peoplelocations       postgres    false    202                       2606    16631    interest interest_id 
   CONSTRAINT     K   ALTER TABLE ONLY interest
    ADD CONSTRAINT interest_id PRIMARY KEY (id);
 G   ALTER TABLE ONLY peoplelocations.interest DROP CONSTRAINT interest_id;
       peoplelocations         postgres    false    201    201                       2606    16604    location location_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY location
    ADD CONSTRAINT location_pkey PRIMARY KEY (id);
 I   ALTER TABLE ONLY peoplelocations.location DROP CONSTRAINT location_pkey;
       peoplelocations         postgres    false    197    197                       2606    16615    person person_id 
   CONSTRAINT     G   ALTER TABLE ONLY person
    ADD CONSTRAINT person_id PRIMARY KEY (id);
 C   ALTER TABLE ONLY peoplelocations.person DROP CONSTRAINT person_id;
       peoplelocations         postgres    false    199    199            
           2606    16639 "   person_interest person_interest_pk 
   CONSTRAINT     Y   ALTER TABLE ONLY person_interest
    ADD CONSTRAINT person_interest_pk PRIMARY KEY (id);
 U   ALTER TABLE ONLY peoplelocations.person_interest DROP CONSTRAINT person_interest_pk;
       peoplelocations         postgres    false    203    203                       2606    16645    person_interest interest_fk    FK CONSTRAINT     s   ALTER TABLE ONLY person_interest
    ADD CONSTRAINT interest_fk FOREIGN KEY (interest_id) REFERENCES interest(id);
 N   ALTER TABLE ONLY peoplelocations.person_interest DROP CONSTRAINT interest_fk;
       peoplelocations       postgres    false    203    2056    201                       2606    16616    person location_id    FK CONSTRAINT     g   ALTER TABLE ONLY person
    ADD CONSTRAINT location_id FOREIGN KEY (location) REFERENCES location(id);
 E   ALTER TABLE ONLY peoplelocations.person DROP CONSTRAINT location_id;
       peoplelocations       postgres    false    197    2052    199                       2606    16640    person_interest person_fk    FK CONSTRAINT     m   ALTER TABLE ONLY person_interest
    ADD CONSTRAINT person_fk FOREIGN KEY (person_id) REFERENCES person(id);
 L   ALTER TABLE ONLY peoplelocations.person_interest DROP CONSTRAINT person_fk;
       peoplelocations       postgres    false    203    2054    199            �       x�3�(�O/J����K�2�tO3b���� �H      �   3   x�3��,,M������v�2��M�-��,�I��K-.NM���qqq D4      �   3   x�3�t�+��ϫ�H-*��42�4�2����N�t�/*J�	q��qqq &h~      �      x�3�4�4�2��\Ɯ@�+F��� !��     