--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.6
-- Dumped by pg_dump version 10.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: enneagram_numbers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.enneagram_numbers (
    id bigint NOT NULL,
    enneagram_number integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    description character varying,
    core_need character varying,
    core_belief character varying,
    core_pattern character varying
);


--
-- Name: enneagram_numbers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.enneagram_numbers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: enneagram_numbers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.enneagram_numbers_id_seq OWNED BY public.enneagram_numbers.id;


--
-- Name: enneagram_scores; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.enneagram_scores (
    id bigint NOT NULL,
    enneagram_one_score integer,
    enneagram_two_score integer,
    enneagram_three_score integer,
    enneagram_four_score integer,
    enneagram_five_score integer,
    enneagram_six_score integer,
    enneagram_seven_score integer,
    enneagream_eight_score integer,
    enneagram_nine_score integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    user_id bigint
);


--
-- Name: enneagram_scores_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.enneagram_scores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: enneagram_scores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.enneagram_scores_id_seq OWNED BY public.enneagram_scores.id;


--
-- Name: pages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pages (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: pages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.pages_id_seq OWNED BY public.pages.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.posts (
    id bigint NOT NULL,
    name character varying,
    title character varying,
    content text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- Name: questions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.questions (
    id bigint NOT NULL,
    question character varying,
    enneagram_number_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    number_multiplier integer DEFAULT 1
);


--
-- Name: questions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.questions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.questions_id_seq OWNED BY public.questions.id;


--
-- Name: responses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.responses (
    id bigint NOT NULL,
    answer integer,
    user_id bigint,
    question_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: responses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.responses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: responses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.responses_id_seq OWNED BY public.responses.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    full_name character varying
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: enneagram_numbers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.enneagram_numbers ALTER COLUMN id SET DEFAULT nextval('public.enneagram_numbers_id_seq'::regclass);


--
-- Name: enneagram_scores id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.enneagram_scores ALTER COLUMN id SET DEFAULT nextval('public.enneagram_scores_id_seq'::regclass);


--
-- Name: pages id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages ALTER COLUMN id SET DEFAULT nextval('public.pages_id_seq'::regclass);


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- Name: questions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.questions ALTER COLUMN id SET DEFAULT nextval('public.questions_id_seq'::regclass);


--
-- Name: responses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.responses ALTER COLUMN id SET DEFAULT nextval('public.responses_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2020-01-24 13:31:39.786059	2020-01-24 13:31:39.786059
\.


--
-- Data for Name: enneagram_numbers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.enneagram_numbers (id, enneagram_number, created_at, updated_at, description, core_need, core_belief, core_pattern) FROM stdin;
1	1	2020-01-24 15:58:20.993008	2020-04-28 20:55:19.588877	The Perfectionist	To be good, right, perfect. 	One is morally defective, not good or acceptable as is. Achieving perfection will bring them peace. 	Type 1s fixate on what is imperfect within themselves and the world around them. They have a strong inner critic that regularly points out where they fall short. 1s overcompensate for these short comings by attempting to make themselves and the world better. They strive to exert control over themselves and their environment in order to achieve what is good and right. 1s create order, pay attention to details, value principles, and work hard. They move from an instinctual sense of what should be done to rational decisions, repressing their emotions, desires, and appetites lest they lead them to bad decision making.   
2	2	2020-01-24 15:58:29.958553	2020-04-28 20:55:33.956504	The Helper	To be seen, wanted, loved, connected. 	That one is not wanted unless helpful or connected emotionally	Type 2s process life through the emotional center. They easily read the emotions of others and often confuse their own feelings with the feelings of those around them. Their empathy helps them discern the needs of others and can easily anticipate what people need. They long to be helpers in hopes of becoming indispensable to someone significant. They believe their own needs will finally be met if they secure the love of others. 2s often struggle with a sense of personal identity because they are so outward focused. They move from picking up on the emotions of others, to coming up with a plan to help and finally leveraging the body to do the work.
3	3	2020-01-24 15:58:34.750071	2020-04-28 20:55:54.575903	The Performer	To be seen, valued, respected, worthwhile	That it is not seen as worthwhile. One only achieves love through earning it. 	Type 3s process through the center of emotion, but are asleep to their own true feelings. Their own emotions get in the way of achievement, success and therefore worthiness. Type 3s are focused on guaranteeing success through planning and moving as quickly and efficiently through a plan of action. Along with types 2 and 4, their sense of identity is formed by how others see them. This  awareness gives them the extraordinary ability to adapt and shape-shift, in order to become whoever they need to be to achieve the positive feedback they desire. This type makes decisions by reading the world through the emotional center, ascending to the head to plan and rationalize actions and leveraging the body to execute those plans. 
4	4	2020-01-24 15:58:39.892957	2020-04-28 20:56:10.083639	The Romantic 	To be seen, special, connected.	There is something missing, incomplete, flawed, or broken. This keeps the type from feeling worthy of love. 	This type begins with an awareness of how they feel. Before 4s can even name their emotions, there is a strong surge of feelings about everything in life. They give a lot of attention to their feelings because the strong emotions seem to confirm that there is something wrong or missing within them. 4s believe if they could be special enough, they wouldn’t feel that everyone else is happier or more worthy than they are. 4s find the ordinary, mundane, routines of life very difficult. The real world seems ugly and it is easier for 4s to retreat away from people and into the imagination. When making decisions, this type will often process information through their emotions, calling on their head to make sense of how they feel and often ignoring their bodies. 
5	5	2020-01-24 15:58:43.967568	2020-04-28 20:56:25.13146	The Observer	To be resourced intellectually in order to meet the world, to hold on to what one has. 	The world demands far more than what the type 5 has to give. 	This type meets their needs by researching, observing, gathering enough information, synthesizing the information, looking for patterns, and always searching for foundational truths. In order for 5s to preserve resources, this type tends to stockpile time, energy, money, personal thoughts and emotions. This management of energy means that privacy is critical. Type 5s prefer compartments in the physical world to help them allocate their resources and meet the demands of others. This is why predictability and routine are very important to the type. When making decisions, they start with the head center spending most of their time there before finally getting the body into motion, and visiting the heart last. 
6	6	2020-01-24 15:58:48.222767	2020-04-28 20:56:41.540987	The Loyal Skeptic	To be safe, secure, supported. 	The world is unsafe and unsupportive.	Type 6s believe the world is unsafe and that people are out to take advantage of others. They tend to feel consistently unsupported, become hypervigilant and lean toward distrust and skepticism. They can be skeptical about good news or bad news. They imagine worst case scenarios so they can anticipate negative outcomes. Sometimes 6s run from perceived danger which they see in a lot of places. Sometimes they run toward danger and push against their fears. 6s value loyalty, maintaining stability, creating safer environments, and obeying or disobeying rules but the motivation is always fear. Because of this ever present anxiety and self-doubt, they tend to seek out guidance from authority figures or push against authority figures as a way of protecting themselves. As a head type, when making decisions they spend a lot of time processing. As they process, they move to the heart center and feel emotion around their fears which fuels their anxiety. They either move into action or freeze in anxiety as a way of feeling safe. 
9	9	2020-01-24 15:59:00.705915	2020-04-28 20:50:37.845133	The Peacemaker	For peace, calm, harmony, and comfort	If I say what I think, feel, or want I will cause conflict, disconnection, and discomfort	Type 9s“fall asleep” to their own desires, thoughts, and emotions to create inner peace, comfort and harmony. 9s become so attuned to the agenda and desires  of others that it becomes hard for them to understand what they think, feel, or want. This pattern, known as merging, makes them easy people to be around but difficult to truly know. When making decisions they deny their gut instinct and ascend to the head as a way of avoiding the right action. They often neutralize their own and other’s emotions
8	8	2020-01-24 15:58:56.357	2020-04-28 19:59:30.286721	The Protector	To be strong, real, impactful	Weakness must be denied in order to prepare for a merciless world.	The 8s call up energy in their bodies to muscle through life. One must be strong in the body and mind. Emotions that lead to weakness and vulnerability must be repressed and denied. Challenges give this type a rush and makes them feel alive. It is important to feel this surge energy in order to be prepared. Type 8s also seek to bring any threat  to the surface in order to grasp the truth and root problems. 8s will challenge someone when they sense hidden motives and dishonesty. They attempt to apply pressure to draw out the truth and strengthen others. This type makes decisions by over-identifying with their gut instinct and justifying their behavior with their head, funneling all emotions into anger in order to survive and maintain control over their environment. 
7	7	2020-01-24 15:58:52.371283	2020-04-28 20:55:05.276209	The Enthusiast	To avoid emotional pain. To be full, satiated, happy, interested.	Emotional pain will catch up overcome them. The present moment is not enough. 	7s seek stimulation by imagining and planning for fun experiences, or chasing new ideas or interests. The current moment will not satisfy their insatiable appetite which is why 7’s avoid personal limits. If a conversation starts to become boring, or their job is no longer fun, or a relationship loses its sizzle, 7s begins to look for something else. There is a constant search for "the buzz." This mindset allows them to become visionaries. They can weave ideas and thoughts into a story. When making decisions, 7’s process at a high rate of speed in the head center tending to move into the body to stay active. They rarely visit the emotional center.  
\.


--
-- Data for Name: enneagram_scores; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.enneagram_scores (id, enneagram_one_score, enneagram_two_score, enneagram_three_score, enneagram_four_score, enneagram_five_score, enneagram_six_score, enneagram_seven_score, enneagream_eight_score, enneagram_nine_score, created_at, updated_at, user_id) FROM stdin;
\.


--
-- Data for Name: pages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.pages (id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.posts (id, name, title, content, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: questions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.questions (id, question, enneagram_number_id, created_at, updated_at, number_multiplier) FROM stdin;
1	I want to be seen as successful	3	2020-01-25 21:05:36.275015	2020-01-25 21:05:36.275015	1
2	I don’t want to be seen as taking up too much space 	9	2020-01-25 21:07:30.060473	2020-01-25 21:07:30.060473	1
3	I want to be seen as authentic and special	4	2020-01-25 21:07:44.510228	2020-01-25 21:07:44.510228	1
4	I want others to see me as worthwhile because of my accomplishments	3	2020-01-25 21:07:57.309816	2020-01-25 21:07:57.309816	1
5	I see myself as more loyal than most	6	2020-01-25 21:08:08.281941	2020-01-25 21:08:08.281941	1
6	I want people to experience me as agreeable and peaceful	9	2020-01-25 21:08:19.089154	2020-01-25 21:08:19.089154	1
7	It’s important that others see me as morally good	1	2020-01-25 21:08:28.536201	2020-01-25 21:08:28.536201	1
8	I need people to see me as strong and self-reliant	8	2020-01-25 21:08:38.037234	2020-01-25 21:08:38.037234	1
9	It’s important that others see me as knowledgable, competent, and useful	5	2020-01-25 21:08:47.159249	2020-01-25 21:08:47.159249	1
10	I want others to see me as interesting and inspiring	7	2020-01-25 21:08:54.722599	2020-01-25 21:08:54.722599	1
11	I want to be seen as someone who offers interesting and fresh ideas	7	2020-01-25 21:09:03.962687	2020-01-25 21:09:03.962687	1
12	I pursue self improvement through inner analysis	1	2020-01-25 21:09:13.21545	2020-01-25 21:09:13.21545	1
13	I have a visceral feeling that I need to do the right thing	1	2020-01-25 21:09:20.799288	2020-01-25 21:09:20.799288	1
14	I am doubtful of myself and others regularly	6	2020-01-25 21:09:31.003381	2020-01-25 21:09:31.003381	1
15	I want to be seen as warm and inviting 	2	2020-01-25 21:09:38.494777	2020-01-25 21:09:38.494777	1
16	I want to be seen as helpful and caring	6	2020-01-25 21:09:47.701234	2020-01-25 21:09:47.701234	1
17	I want to be seen and affirmed as helpful 	2	2020-01-25 21:09:53.905678	2020-01-25 21:09:53.905678	1
19	I am deeply frustrated when the source of information is unreliable 	5	2020-01-25 21:10:08.205089	2020-01-25 21:10:08.205089	1
20	I want to receive from my relationships whatever I feel I’m putting in	4	2020-01-25 21:10:15.391913	2020-01-25 21:10:15.391913	1
21	I avoid action if I don’t think I have the energy to do it competently 	5	2020-01-25 21:10:22.613942	2020-01-25 21:10:22.613942	1
22	I feel others can be dismissive about my concerns 	6	2020-01-25 21:10:29.360777	2020-01-25 21:10:29.360777	1
23	I often avoid doing things if they aren’t fun and interesting 	7	2020-01-25 21:10:40.585323	2020-01-25 21:10:40.585323	1
24	I notice a consistent moral inner critic that is both friend and foe 	1	2020-01-25 21:10:46.78377	2020-01-25 21:10:46.78377	1
25	Most people move to slow	3	2020-01-25 21:10:54.500059	2020-01-25 21:10:54.500059	1
26	I want to be wanted 	2	2020-01-25 21:11:06.445725	2020-01-25 21:11:06.445725	1
27	I ruminate too long in my decision making 	6	2020-01-25 21:11:13.983816	2020-01-25 21:11:13.983816	1
28	I’ve been told I’m too sensitive and emotional 	4	2020-01-25 21:11:20.275947	2020-01-25 21:11:20.275947	1
29	I’ve been told I’m too intense and need to bring my energy down 	8	2020-01-25 21:11:30.236227	2020-01-25 21:11:30.236227	1
30	I’m often longing for something I feel is missing 	4	2020-01-25 21:11:36.983244	2020-01-25 21:11:36.983244	1
31	I’m not sure I’ll ever know what I want out of life	9	2020-01-25 21:11:45.601748	2020-01-25 21:11:45.601748	1
32	I seek relational reciprocity	4	2020-01-25 21:11:52.502769	2020-01-25 21:11:52.502769	1
33	I put in a lot of work to make others like me 	2	2020-01-25 21:12:01.831487	2020-01-25 21:12:01.831487	1
34	My attention often goes to disaster planning and preparing for worst case scenario 	6	2020-01-25 21:12:09.65327	2020-01-25 21:12:09.65327	1
35	My attention often goes to wondering what others want from me	9	2020-01-25 21:12:16.439626	2020-01-25 21:12:16.439626	1
36	I seek unconventional ideas and reliable research	5	2020-01-25 21:12:24.006125	2020-01-25 21:12:24.006125	1
37	I tend to do information gathering and a lot of research before making any decision 	5	2020-01-25 21:12:33.37788	2020-01-25 21:12:33.37788	1
38	It’s easier to go along with someone else’s agenda than to speak up	9	2020-01-25 21:12:42.67177	2020-01-25 21:12:42.67177	1
39	My attention goes to how much or how little I’m doing 	8	2020-01-25 21:12:49.788437	2020-01-25 21:12:49.788437	1
40	I don’t feel emotionally understood	4	2020-01-25 21:12:57.693603	2020-01-25 21:12:57.693603	1
41	I often feel under-resourced in a demanding world	5	2020-01-25 21:13:06.834558	2020-01-25 21:13:06.834558	1
42	My attention tends toward anticipating future outcomes 	6	2020-01-25 21:13:12.81233	2020-01-25 21:13:12.81233	1
43	I have a high desire to be seen and often feel I’m not	3	2020-01-25 21:13:18.99085	2020-01-25 21:13:18.99085	1
44	I often feel the need for affirmation, approval, and feedback from others 	2	2020-01-25 21:13:26.95721	2020-01-25 21:13:26.95721	1
45	I am consistently aware of emotions of those around me	2	2020-01-25 21:13:35.93372	2020-01-25 21:13:35.93372	1
46	I read and react to the emotions of those around me	2	2020-01-25 21:13:41.740402	2020-01-25 21:13:41.740402	1
47	I am able to read the emotions of others and notice my own simultaneously 	4	2020-01-25 21:13:48.010993	2020-01-25 21:13:48.010993	1
48	When Making Decisions, I look for the most efficient path to success	3	2020-01-25 21:14:30.198068	2020-01-25 21:14:30.198068	1
49	When Making Decisions, I start by thinking of everything that could go wrong	6	2020-01-25 21:14:40.00888	2020-01-25 21:14:40.00888	1
50	When Making Decisions, I look for what will cause the least amount of discomfort or disruption	9	2020-01-25 21:14:51.463037	2020-01-25 21:14:51.463037	1
51	When Making Decisions, I evaluate what morally right and take the best course of action	1	2020-01-25 21:14:59.12744	2020-01-25 21:14:59.12744	1
52	When Making Decisions, I seek to express my heart in a unique and creative way	4	2020-01-25 21:15:06.027094	2020-01-25 21:15:06.027094	1
53	When Making Decisions, I think about who it’s going to help and the possibility of positive feedback	2	2020-01-25 21:15:12.141755	2020-01-25 21:15:12.141755	1
54	When Making Decisions, I look for situations where I can have control and autonomy and where I can add value	8	2020-01-25 21:15:19.301011	2020-01-25 21:15:19.301011	1
55	When Making Decisions, I research and gather dependable data to insure I can thoroughly think it through	5	2020-01-25 21:15:26.473191	2020-01-25 21:15:26.473191	1
56	When Making Decisions, I seek what is inspiring and significant and resist being restricted or confined	7	2020-01-25 21:15:33.678529	2020-01-25 21:15:33.678529	1
57	The primary way I help people is by protecting them, defending them, and making them stronger 	8	2020-01-25 21:15:44.776171	2020-01-25 21:15:44.776171	1
58	The primary way I help people is by providing a solution and efficient plan for success	3	2020-01-25 21:15:51.489787	2020-01-25 21:15:51.489787	1
59	The primary way I help people is by providing security, safety, and support	6	2020-01-25 21:15:59.825998	2020-01-25 21:15:59.825998	1
60	The primary way I help people is by providing a peaceful environment and conflict free zone 	9	2020-01-25 21:16:06.837745	2020-01-25 21:16:06.837745	1
61	The primary way I help people is by doing things the way they should be done	1	2020-01-25 21:16:14.033356	2020-01-25 21:16:14.033356	1
62	The primary way I help people is by reading and meeting their needs often before asked 	2	2020-01-25 21:16:21.025857	2020-01-25 21:16:21.025857	1
63	The primary way I help people is by making them feel accepted, special, and uniquely seen	4	2020-01-25 21:16:29.095915	2020-01-25 21:16:29.095915	1
18	I do not want to be criticized when I’m imperfect	1	2020-01-25 21:10:00.875035	2020-01-28 00:38:15.996032	1
64	The primary way I help people is by giving them reliable, well-researched information, and an informed perspective	5	2020-01-25 21:16:36.706639	2020-01-25 21:16:36.706639	1
65	The primary way I help people is by giving fresh ideas, solutions, and ways of thinking in order to get unstuck and be happier 	7	2020-01-25 21:16:45.456194	2020-01-25 21:16:45.456194	1
66	I plan the work and work the plan to achieve success and affirmation. I’m frustrated when people impede progress, loose focus, and are inefficient	3	2020-01-25 21:16:52.849451	2020-03-03 00:27:10.865558	2
67	I mitigate ongoing dangers by surfacing and dealing with potential threats. I’m frustrated when people tell me not to worry and aren’t unaware of what could be lurking the shadows	6	2020-01-25 21:17:00.38199	2020-03-03 00:27:21.644639	2
68	I maintain comfort, peace, and harmony at the expense of my own priorities. I’m frustrated when people stir up issues or rock the boat disrupting my inner calm	9	2020-01-25 21:17:07.641483	2020-03-03 00:27:28.618932	2
69	Good enough is not good enough. I am frustrated by how people lack integrity, are undisciplined, and don’t do the right thing	1	2020-01-25 21:17:14.880405	2020-03-03 00:27:35.087108	2
70	Average or mundane means unseen. I am frustrated when people don’t understand me at the emotional level either by avoiding or trying to fix me	4	2020-01-25 21:17:22.209209	2020-03-03 00:27:42.642638	2
71	Helpful people are loved people. My frustration comes from people who do not see the help I give or withhold gratitude	2	2020-01-25 21:17:29.883517	2020-03-03 00:27:48.970186	2
72	I use my strength to make things happen now. I am frustrated by situations that require sensitivity, vulnerability, or take too long	8	2020-01-25 21:17:41.89823	2020-03-03 00:27:54.660821	2
73	There is never enough knowledge or information. I’m frustrated when people crowd my space and demand more resources than I am prepared to give.	5	2020-01-25 21:17:48.749967	2020-03-03 00:28:01.474697	2
74	Nothing in the present holds my attention for long. I’m frustrated when I feel constrained or deprived from what I want to pursue freely right now	7	2020-01-25 21:17:59.056521	2020-03-03 00:28:07.55449	2
\.


--
-- Data for Name: responses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.responses (id, answer, user_id, question_id, created_at, updated_at) FROM stdin;
4742	50	1	1	2020-03-03 00:41:05.80571	2020-03-03 00:41:05.80571
4743	50	1	2	2020-03-03 00:41:05.867116	2020-03-03 00:41:05.867116
4744	50	1	3	2020-03-03 00:41:05.880044	2020-03-03 00:41:05.880044
4745	50	1	4	2020-03-03 00:41:05.89115	2020-03-03 00:41:05.89115
4746	50	1	5	2020-03-03 00:41:05.907287	2020-03-03 00:41:05.907287
4747	50	1	6	2020-03-03 00:41:05.920957	2020-03-03 00:41:05.920957
4748	50	1	7	2020-03-03 00:41:05.931299	2020-03-03 00:41:05.931299
4749	50	1	8	2020-03-03 00:41:05.946503	2020-03-03 00:41:05.946503
4750	50	1	9	2020-03-03 00:41:05.955618	2020-03-03 00:41:05.955618
4751	50	1	10	2020-03-03 00:41:05.967331	2020-03-03 00:41:05.967331
4752	50	1	11	2020-03-03 00:41:05.980324	2020-03-03 00:41:05.980324
4753	50	1	12	2020-03-03 00:41:05.989954	2020-03-03 00:41:05.989954
4754	50	1	13	2020-03-03 00:41:06.001408	2020-03-03 00:41:06.001408
4755	50	1	14	2020-03-03 00:41:06.012466	2020-03-03 00:41:06.012466
4756	50	1	15	2020-03-03 00:41:06.021948	2020-03-03 00:41:06.021948
4757	50	1	16	2020-03-03 00:41:06.032267	2020-03-03 00:41:06.032267
4758	50	1	17	2020-03-03 00:41:06.044217	2020-03-03 00:41:06.044217
4759	50	1	18	2020-03-03 00:41:06.054336	2020-03-03 00:41:06.054336
4760	50	1	19	2020-03-03 00:41:06.069961	2020-03-03 00:41:06.069961
4761	50	1	20	2020-03-03 00:41:06.080019	2020-03-03 00:41:06.080019
4762	50	1	21	2020-03-03 00:41:06.090706	2020-03-03 00:41:06.090706
4763	50	1	22	2020-03-03 00:41:06.105316	2020-03-03 00:41:06.105316
4764	50	1	23	2020-03-03 00:41:06.114971	2020-03-03 00:41:06.114971
4765	50	1	24	2020-03-03 00:41:06.127297	2020-03-03 00:41:06.127297
4766	50	1	25	2020-03-03 00:41:06.137369	2020-03-03 00:41:06.137369
4767	50	1	26	2020-03-03 00:41:06.147532	2020-03-03 00:41:06.147532
4768	50	1	27	2020-03-03 00:41:06.157642	2020-03-03 00:41:06.157642
4769	50	1	28	2020-03-03 00:41:06.168168	2020-03-03 00:41:06.168168
4770	50	1	29	2020-03-03 00:41:06.178674	2020-03-03 00:41:06.178674
4771	50	1	30	2020-03-03 00:41:06.188286	2020-03-03 00:41:06.188286
4772	50	1	31	2020-03-03 00:41:06.19768	2020-03-03 00:41:06.19768
4773	50	1	32	2020-03-03 00:41:06.210914	2020-03-03 00:41:06.210914
4774	50	1	33	2020-03-03 00:41:06.222187	2020-03-03 00:41:06.222187
4775	50	1	34	2020-03-03 00:41:06.232206	2020-03-03 00:41:06.232206
4776	50	1	35	2020-03-03 00:41:06.247916	2020-03-03 00:41:06.247916
4777	50	1	36	2020-03-03 00:41:06.264699	2020-03-03 00:41:06.264699
4778	50	1	37	2020-03-03 00:41:06.331541	2020-03-03 00:41:06.331541
4779	50	1	38	2020-03-03 00:41:06.348614	2020-03-03 00:41:06.348614
4780	50	1	39	2020-03-03 00:41:06.360366	2020-03-03 00:41:06.360366
4781	50	1	40	2020-03-03 00:41:06.371323	2020-03-03 00:41:06.371323
4782	50	1	41	2020-03-03 00:41:06.384327	2020-03-03 00:41:06.384327
4783	50	1	42	2020-03-03 00:41:06.398811	2020-03-03 00:41:06.398811
4784	50	1	43	2020-03-03 00:41:06.408719	2020-03-03 00:41:06.408719
4785	50	1	44	2020-03-03 00:41:06.419036	2020-03-03 00:41:06.419036
4786	50	1	45	2020-03-03 00:41:06.430343	2020-03-03 00:41:06.430343
4787	50	1	46	2020-03-03 00:41:06.443419	2020-03-03 00:41:06.443419
4788	50	1	47	2020-03-03 00:41:06.497118	2020-03-03 00:41:06.497118
4789	50	1	48	2020-03-03 00:41:06.509552	2020-03-03 00:41:06.509552
4790	50	1	49	2020-03-03 00:41:06.520712	2020-03-03 00:41:06.520712
4791	50	1	50	2020-03-03 00:41:06.531011	2020-03-03 00:41:06.531011
4792	50	1	51	2020-03-03 00:41:06.540874	2020-03-03 00:41:06.540874
4793	50	1	52	2020-03-03 00:41:06.553022	2020-03-03 00:41:06.553022
4794	50	1	53	2020-03-03 00:41:06.563615	2020-03-03 00:41:06.563615
4795	50	1	54	2020-03-03 00:41:06.573575	2020-03-03 00:41:06.573575
4796	50	1	55	2020-03-03 00:41:06.585043	2020-03-03 00:41:06.585043
4797	50	1	56	2020-03-03 00:41:06.595578	2020-03-03 00:41:06.595578
4798	50	1	57	2020-03-03 00:41:06.605153	2020-03-03 00:41:06.605153
4799	50	1	58	2020-03-03 00:41:06.615951	2020-03-03 00:41:06.615951
4800	50	1	59	2020-03-03 00:41:06.625741	2020-03-03 00:41:06.625741
4801	50	1	60	2020-03-03 00:41:06.636279	2020-03-03 00:41:06.636279
4802	50	1	61	2020-03-03 00:41:06.647361	2020-03-03 00:41:06.647361
4803	50	1	62	2020-03-03 00:41:06.657557	2020-03-03 00:41:06.657557
4804	50	1	63	2020-03-03 00:41:06.671753	2020-03-03 00:41:06.671753
4805	50	1	64	2020-03-03 00:41:06.685507	2020-03-03 00:41:06.685507
4806	50	1	65	2020-03-03 00:41:06.696323	2020-03-03 00:41:06.696323
4807	50	1	66	2020-03-03 00:41:06.707563	2020-03-03 00:41:06.707563
4808	50	1	67	2020-03-03 00:41:06.718274	2020-03-03 00:41:06.718274
4809	50	1	68	2020-03-03 00:41:06.729502	2020-03-03 00:41:06.729502
4810	50	1	69	2020-03-03 00:41:06.739253	2020-03-03 00:41:06.739253
4811	50	1	70	2020-03-03 00:41:06.74947	2020-03-03 00:41:06.74947
4812	50	1	71	2020-03-03 00:41:06.759826	2020-03-03 00:41:06.759826
4813	50	1	72	2020-03-03 00:41:06.771229	2020-03-03 00:41:06.771229
4814	0	1	73	2020-03-03 00:41:06.782441	2020-03-03 00:41:06.782441
4815	100	1	74	2020-03-03 00:41:06.79245	2020-03-03 00:41:06.79245
4816	39	1	1	2020-03-11 23:42:32.543563	2020-03-11 23:42:32.543563
4817	50	1	2	2020-03-11 23:42:32.754892	2020-03-11 23:42:32.754892
4818	50	1	3	2020-03-11 23:42:32.814529	2020-03-11 23:42:32.814529
4819	50	1	4	2020-03-11 23:42:32.861413	2020-03-11 23:42:32.861413
4820	50	1	5	2020-03-11 23:42:32.905291	2020-03-11 23:42:32.905291
4821	50	1	6	2020-03-11 23:42:32.931862	2020-03-11 23:42:32.931862
4822	50	1	7	2020-03-11 23:42:32.967647	2020-03-11 23:42:32.967647
4823	50	1	8	2020-03-11 23:42:33.012021	2020-03-11 23:42:33.012021
4824	50	1	9	2020-03-11 23:42:33.078837	2020-03-11 23:42:33.078837
4825	50	1	10	2020-03-11 23:42:33.105242	2020-03-11 23:42:33.105242
4826	50	1	11	2020-03-11 23:42:33.136098	2020-03-11 23:42:33.136098
4827	50	1	12	2020-03-11 23:42:33.191322	2020-03-11 23:42:33.191322
4828	50	1	13	2020-03-11 23:42:33.212269	2020-03-11 23:42:33.212269
4829	50	1	14	2020-03-11 23:42:33.233478	2020-03-11 23:42:33.233478
4830	50	1	15	2020-03-11 23:42:33.294773	2020-03-11 23:42:33.294773
4831	50	1	16	2020-03-11 23:42:33.353763	2020-03-11 23:42:33.353763
4832	50	1	17	2020-03-11 23:42:33.407441	2020-03-11 23:42:33.407441
4833	50	1	18	2020-03-11 23:42:33.47101	2020-03-11 23:42:33.47101
4834	50	1	19	2020-03-11 23:42:33.52564	2020-03-11 23:42:33.52564
4835	50	1	20	2020-03-11 23:42:33.563951	2020-03-11 23:42:33.563951
4836	50	1	21	2020-03-11 23:42:33.659559	2020-03-11 23:42:33.659559
4837	50	1	22	2020-03-11 23:42:33.711269	2020-03-11 23:42:33.711269
4838	50	1	23	2020-03-11 23:42:33.730411	2020-03-11 23:42:33.730411
4839	50	1	24	2020-03-11 23:42:33.748223	2020-03-11 23:42:33.748223
4840	50	1	25	2020-03-11 23:42:33.772466	2020-03-11 23:42:33.772466
4841	50	1	26	2020-03-11 23:42:33.825543	2020-03-11 23:42:33.825543
4842	50	1	27	2020-03-11 23:42:33.875697	2020-03-11 23:42:33.875697
4843	50	1	28	2020-03-11 23:42:33.89406	2020-03-11 23:42:33.89406
4844	50	1	29	2020-03-11 23:42:33.943475	2020-03-11 23:42:33.943475
4845	50	1	30	2020-03-11 23:42:33.955459	2020-03-11 23:42:33.955459
4846	50	1	31	2020-03-11 23:42:33.974974	2020-03-11 23:42:33.974974
4847	50	1	32	2020-03-11 23:42:34.026638	2020-03-11 23:42:34.026638
4848	50	1	33	2020-03-11 23:42:34.04437	2020-03-11 23:42:34.04437
4849	50	1	34	2020-03-11 23:42:34.061395	2020-03-11 23:42:34.061395
4850	50	1	35	2020-03-11 23:42:34.094246	2020-03-11 23:42:34.094246
4851	50	1	36	2020-03-11 23:42:34.116284	2020-03-11 23:42:34.116284
4852	50	1	37	2020-03-11 23:42:34.132935	2020-03-11 23:42:34.132935
4853	50	1	38	2020-03-11 23:42:34.150625	2020-03-11 23:42:34.150625
4854	50	1	39	2020-03-11 23:42:34.170895	2020-03-11 23:42:34.170895
4855	50	1	40	2020-03-11 23:42:34.191903	2020-03-11 23:42:34.191903
4856	50	1	41	2020-03-11 23:42:34.211539	2020-03-11 23:42:34.211539
4857	50	1	42	2020-03-11 23:42:34.232562	2020-03-11 23:42:34.232562
4858	50	1	43	2020-03-11 23:42:34.2509	2020-03-11 23:42:34.2509
4859	50	1	44	2020-03-11 23:42:34.315564	2020-03-11 23:42:34.315564
4860	50	1	45	2020-03-11 23:42:34.370082	2020-03-11 23:42:34.370082
4861	50	1	46	2020-03-11 23:42:34.42849	2020-03-11 23:42:34.42849
4862	50	1	47	2020-03-11 23:42:34.446201	2020-03-11 23:42:34.446201
4863	50	1	48	2020-03-11 23:42:34.466893	2020-03-11 23:42:34.466893
4864	50	1	49	2020-03-11 23:42:34.483907	2020-03-11 23:42:34.483907
4865	50	1	50	2020-03-11 23:42:34.503316	2020-03-11 23:42:34.503316
4866	50	1	51	2020-03-11 23:42:34.524582	2020-03-11 23:42:34.524582
4867	50	1	52	2020-03-11 23:42:34.543087	2020-03-11 23:42:34.543087
4868	50	1	53	2020-03-11 23:42:34.566907	2020-03-11 23:42:34.566907
4869	50	1	54	2020-03-11 23:42:34.586745	2020-03-11 23:42:34.586745
4870	50	1	55	2020-03-11 23:42:34.620673	2020-03-11 23:42:34.620673
4871	50	1	56	2020-03-11 23:42:34.649319	2020-03-11 23:42:34.649319
4872	50	1	57	2020-03-11 23:42:34.667125	2020-03-11 23:42:34.667125
4873	50	1	58	2020-03-11 23:42:34.690194	2020-03-11 23:42:34.690194
4874	50	1	59	2020-03-11 23:42:34.70622	2020-03-11 23:42:34.70622
4875	50	1	60	2020-03-11 23:42:34.721486	2020-03-11 23:42:34.721486
4876	50	1	61	2020-03-11 23:42:34.736964	2020-03-11 23:42:34.736964
4877	50	1	62	2020-03-11 23:42:34.760417	2020-03-11 23:42:34.760417
4878	50	1	63	2020-03-11 23:42:34.781565	2020-03-11 23:42:34.781565
4879	50	1	64	2020-03-11 23:42:34.800937	2020-03-11 23:42:34.800937
4880	50	1	65	2020-03-11 23:42:34.817175	2020-03-11 23:42:34.817175
4881	50	1	66	2020-03-11 23:42:34.838778	2020-03-11 23:42:34.838778
4882	50	1	67	2020-03-11 23:42:34.85249	2020-03-11 23:42:34.85249
4883	50	1	68	2020-03-11 23:42:34.870274	2020-03-11 23:42:34.870274
4884	50	1	69	2020-03-11 23:42:34.891021	2020-03-11 23:42:34.891021
4885	50	1	70	2020-03-11 23:42:34.907589	2020-03-11 23:42:34.907589
4886	50	1	71	2020-03-11 23:42:34.925406	2020-03-11 23:42:34.925406
4887	50	1	72	2020-03-11 23:42:34.948974	2020-03-11 23:42:34.948974
4888	50	1	73	2020-03-11 23:42:34.972711	2020-03-11 23:42:34.972711
4889	62	1	74	2020-03-11 23:42:34.999663	2020-03-11 23:42:34.999663
4890	50	1	1	2020-03-11 23:42:48.167981	2020-03-11 23:42:48.167981
4891	50	1	2	2020-03-11 23:42:48.19041	2020-03-11 23:42:48.19041
4892	50	1	3	2020-03-11 23:42:48.20744	2020-03-11 23:42:48.20744
4893	50	1	4	2020-03-11 23:42:48.232111	2020-03-11 23:42:48.232111
4894	50	1	5	2020-03-11 23:42:48.254746	2020-03-11 23:42:48.254746
4895	50	1	6	2020-03-11 23:42:48.278775	2020-03-11 23:42:48.278775
4896	50	1	7	2020-03-11 23:42:48.304363	2020-03-11 23:42:48.304363
4897	50	1	8	2020-03-11 23:42:48.321697	2020-03-11 23:42:48.321697
4898	50	1	9	2020-03-11 23:42:48.33929	2020-03-11 23:42:48.33929
4899	50	1	10	2020-03-11 23:42:48.362622	2020-03-11 23:42:48.362622
4900	50	1	11	2020-03-11 23:42:48.384543	2020-03-11 23:42:48.384543
4901	50	1	12	2020-03-11 23:42:48.400619	2020-03-11 23:42:48.400619
4902	50	1	13	2020-03-11 23:42:48.42429	2020-03-11 23:42:48.42429
4903	50	1	14	2020-03-11 23:42:48.445961	2020-03-11 23:42:48.445961
4904	50	1	15	2020-03-11 23:42:48.467371	2020-03-11 23:42:48.467371
4905	50	1	16	2020-03-11 23:42:48.484209	2020-03-11 23:42:48.484209
4906	50	1	17	2020-03-11 23:42:48.504569	2020-03-11 23:42:48.504569
4907	50	1	18	2020-03-11 23:42:48.524673	2020-03-11 23:42:48.524673
4908	50	1	19	2020-03-11 23:42:48.558455	2020-03-11 23:42:48.558455
4909	50	1	20	2020-03-11 23:42:48.576108	2020-03-11 23:42:48.576108
4910	50	1	21	2020-03-11 23:42:48.599643	2020-03-11 23:42:48.599643
4911	50	1	22	2020-03-11 23:42:48.637284	2020-03-11 23:42:48.637284
4912	50	1	23	2020-03-11 23:42:48.663199	2020-03-11 23:42:48.663199
4913	50	1	24	2020-03-11 23:42:48.685856	2020-03-11 23:42:48.685856
4914	50	1	25	2020-03-11 23:42:48.705918	2020-03-11 23:42:48.705918
4915	50	1	26	2020-03-11 23:42:48.726977	2020-03-11 23:42:48.726977
4916	50	1	27	2020-03-11 23:42:48.748971	2020-03-11 23:42:48.748971
4917	50	1	28	2020-03-11 23:42:48.773553	2020-03-11 23:42:48.773553
4918	50	1	29	2020-03-11 23:42:48.793515	2020-03-11 23:42:48.793515
4919	50	1	30	2020-03-11 23:42:48.813761	2020-03-11 23:42:48.813761
4920	50	1	31	2020-03-11 23:42:48.838671	2020-03-11 23:42:48.838671
4921	50	1	32	2020-03-11 23:42:48.858711	2020-03-11 23:42:48.858711
4922	50	1	33	2020-03-11 23:42:48.887013	2020-03-11 23:42:48.887013
4923	50	1	34	2020-03-11 23:42:48.908178	2020-03-11 23:42:48.908178
4924	50	1	35	2020-03-11 23:42:48.926961	2020-03-11 23:42:48.926961
4925	50	1	36	2020-03-11 23:42:48.949281	2020-03-11 23:42:48.949281
4926	50	1	37	2020-03-11 23:42:48.968536	2020-03-11 23:42:48.968536
4927	50	1	38	2020-03-11 23:42:49.006406	2020-03-11 23:42:49.006406
4928	50	1	39	2020-03-11 23:42:49.055585	2020-03-11 23:42:49.055585
4929	50	1	40	2020-03-11 23:42:49.093029	2020-03-11 23:42:49.093029
4930	50	1	41	2020-03-11 23:42:49.137951	2020-03-11 23:42:49.137951
4931	50	1	42	2020-03-11 23:42:49.157438	2020-03-11 23:42:49.157438
4932	50	1	43	2020-03-11 23:42:49.176341	2020-03-11 23:42:49.176341
4933	50	1	44	2020-03-11 23:42:49.191474	2020-03-11 23:42:49.191474
4934	50	1	45	2020-03-11 23:42:49.213779	2020-03-11 23:42:49.213779
4935	50	1	46	2020-03-11 23:42:49.232013	2020-03-11 23:42:49.232013
4936	50	1	47	2020-03-11 23:42:49.254293	2020-03-11 23:42:49.254293
4937	50	1	48	2020-03-11 23:42:49.276316	2020-03-11 23:42:49.276316
4938	50	1	49	2020-03-11 23:42:49.321541	2020-03-11 23:42:49.321541
4939	50	1	50	2020-03-11 23:42:49.361044	2020-03-11 23:42:49.361044
4940	50	1	51	2020-03-11 23:42:49.395793	2020-03-11 23:42:49.395793
4941	50	1	52	2020-03-11 23:42:49.436242	2020-03-11 23:42:49.436242
4942	50	1	53	2020-03-11 23:42:49.466561	2020-03-11 23:42:49.466561
4943	50	1	54	2020-03-11 23:42:49.506897	2020-03-11 23:42:49.506897
4944	50	1	55	2020-03-11 23:42:49.526694	2020-03-11 23:42:49.526694
4945	50	1	56	2020-03-11 23:42:49.569073	2020-03-11 23:42:49.569073
4946	50	1	57	2020-03-11 23:42:49.583703	2020-03-11 23:42:49.583703
4947	50	1	58	2020-03-11 23:42:49.603801	2020-03-11 23:42:49.603801
4948	50	1	59	2020-03-11 23:42:49.637242	2020-03-11 23:42:49.637242
4949	50	1	60	2020-03-11 23:42:49.677805	2020-03-11 23:42:49.677805
4950	50	1	61	2020-03-11 23:42:49.703918	2020-03-11 23:42:49.703918
4951	50	1	62	2020-03-11 23:42:49.731716	2020-03-11 23:42:49.731716
4952	50	1	63	2020-03-11 23:42:49.75679	2020-03-11 23:42:49.75679
4953	50	1	64	2020-03-11 23:42:49.816559	2020-03-11 23:42:49.816559
4954	50	1	65	2020-03-11 23:42:49.854814	2020-03-11 23:42:49.854814
4955	50	1	66	2020-03-11 23:42:49.878904	2020-03-11 23:42:49.878904
4956	50	1	67	2020-03-11 23:42:49.90567	2020-03-11 23:42:49.90567
4957	50	1	68	2020-03-11 23:42:49.926261	2020-03-11 23:42:49.926261
4958	50	1	69	2020-03-11 23:42:49.949576	2020-03-11 23:42:49.949576
4959	50	1	70	2020-03-11 23:42:49.971736	2020-03-11 23:42:49.971736
4960	50	1	71	2020-03-11 23:42:49.9962	2020-03-11 23:42:49.9962
4961	50	1	72	2020-03-11 23:42:50.025945	2020-03-11 23:42:50.025945
4962	50	1	73	2020-03-11 23:42:50.05659	2020-03-11 23:42:50.05659
4963	50	1	74	2020-03-11 23:42:50.080498	2020-03-11 23:42:50.080498
4964	50	1	1	2020-03-11 23:43:41.518027	2020-03-11 23:43:41.518027
4965	50	1	2	2020-03-11 23:43:41.546672	2020-03-11 23:43:41.546672
4966	50	1	3	2020-03-11 23:43:41.584519	2020-03-11 23:43:41.584519
4967	50	1	4	2020-03-11 23:43:41.605783	2020-03-11 23:43:41.605783
4968	50	1	5	2020-03-11 23:43:41.648577	2020-03-11 23:43:41.648577
4969	50	1	6	2020-03-11 23:43:41.693285	2020-03-11 23:43:41.693285
4970	50	1	7	2020-03-11 23:43:41.709192	2020-03-11 23:43:41.709192
4971	50	1	8	2020-03-11 23:43:41.727006	2020-03-11 23:43:41.727006
4972	50	1	9	2020-03-11 23:43:41.74521	2020-03-11 23:43:41.74521
4973	50	1	10	2020-03-11 23:43:41.759338	2020-03-11 23:43:41.759338
4974	50	1	11	2020-03-11 23:43:41.77421	2020-03-11 23:43:41.77421
4975	50	1	12	2020-03-11 23:43:41.791485	2020-03-11 23:43:41.791485
4976	50	1	13	2020-03-11 23:43:41.806734	2020-03-11 23:43:41.806734
4977	50	1	14	2020-03-11 23:43:41.833845	2020-03-11 23:43:41.833845
4978	50	1	15	2020-03-11 23:43:41.945506	2020-03-11 23:43:41.945506
4979	50	1	16	2020-03-11 23:43:41.995604	2020-03-11 23:43:41.995604
4980	50	1	17	2020-03-11 23:43:42.031623	2020-03-11 23:43:42.031623
4981	50	1	18	2020-03-11 23:43:42.06693	2020-03-11 23:43:42.06693
4982	50	1	19	2020-03-11 23:43:42.122608	2020-03-11 23:43:42.122608
4983	50	1	20	2020-03-11 23:43:42.158918	2020-03-11 23:43:42.158918
4984	50	1	21	2020-03-11 23:43:42.186391	2020-03-11 23:43:42.186391
4985	50	1	22	2020-03-11 23:43:42.213794	2020-03-11 23:43:42.213794
4986	50	1	23	2020-03-11 23:43:42.237666	2020-03-11 23:43:42.237666
4987	50	1	24	2020-03-11 23:43:42.257705	2020-03-11 23:43:42.257705
4988	50	1	25	2020-03-11 23:43:42.275184	2020-03-11 23:43:42.275184
4989	50	1	26	2020-03-11 23:43:42.290926	2020-03-11 23:43:42.290926
4990	50	1	27	2020-03-11 23:43:42.309293	2020-03-11 23:43:42.309293
4991	50	1	28	2020-03-11 23:43:42.32794	2020-03-11 23:43:42.32794
4992	50	1	29	2020-03-11 23:43:42.356605	2020-03-11 23:43:42.356605
4993	50	1	30	2020-03-11 23:43:42.383911	2020-03-11 23:43:42.383911
4994	50	1	31	2020-03-11 23:43:42.401504	2020-03-11 23:43:42.401504
4995	50	1	32	2020-03-11 23:43:42.439764	2020-03-11 23:43:42.439764
4996	50	1	33	2020-03-11 23:43:42.469397	2020-03-11 23:43:42.469397
4997	50	1	34	2020-03-11 23:43:42.486389	2020-03-11 23:43:42.486389
4998	50	1	35	2020-03-11 23:43:42.50233	2020-03-11 23:43:42.50233
4999	50	1	36	2020-03-11 23:43:42.528801	2020-03-11 23:43:42.528801
5000	50	1	37	2020-03-11 23:43:42.5543	2020-03-11 23:43:42.5543
5001	50	1	38	2020-03-11 23:43:42.572715	2020-03-11 23:43:42.572715
5002	50	1	39	2020-03-11 23:43:42.588081	2020-03-11 23:43:42.588081
5003	50	1	40	2020-03-11 23:43:42.603317	2020-03-11 23:43:42.603317
5004	50	1	41	2020-03-11 23:43:42.6189	2020-03-11 23:43:42.6189
5005	50	1	42	2020-03-11 23:43:42.637001	2020-03-11 23:43:42.637001
5006	50	1	43	2020-03-11 23:43:42.655304	2020-03-11 23:43:42.655304
5007	50	1	44	2020-03-11 23:43:42.671451	2020-03-11 23:43:42.671451
5008	50	1	45	2020-03-11 23:43:42.685527	2020-03-11 23:43:42.685527
5009	50	1	46	2020-03-11 23:43:42.70751	2020-03-11 23:43:42.70751
5010	50	1	47	2020-03-11 23:43:42.732052	2020-03-11 23:43:42.732052
5011	50	1	48	2020-03-11 23:43:42.750883	2020-03-11 23:43:42.750883
5012	50	1	49	2020-03-11 23:43:42.769313	2020-03-11 23:43:42.769313
5013	50	1	50	2020-03-11 23:43:42.793071	2020-03-11 23:43:42.793071
5014	50	1	51	2020-03-11 23:43:42.819461	2020-03-11 23:43:42.819461
5015	50	1	52	2020-03-11 23:43:42.848256	2020-03-11 23:43:42.848256
5016	50	1	53	2020-03-11 23:43:42.869883	2020-03-11 23:43:42.869883
5017	50	1	54	2020-03-11 23:43:42.894244	2020-03-11 23:43:42.894244
5018	50	1	55	2020-03-11 23:43:42.913272	2020-03-11 23:43:42.913272
5019	50	1	56	2020-03-11 23:43:42.929438	2020-03-11 23:43:42.929438
5020	50	1	57	2020-03-11 23:43:42.950253	2020-03-11 23:43:42.950253
5021	50	1	58	2020-03-11 23:43:42.980137	2020-03-11 23:43:42.980137
5022	50	1	59	2020-03-11 23:43:43.006435	2020-03-11 23:43:43.006435
5023	50	1	60	2020-03-11 23:43:43.046451	2020-03-11 23:43:43.046451
5024	50	1	61	2020-03-11 23:43:43.067338	2020-03-11 23:43:43.067338
5025	50	1	62	2020-03-11 23:43:43.085684	2020-03-11 23:43:43.085684
5026	50	1	63	2020-03-11 23:43:43.107646	2020-03-11 23:43:43.107646
5027	50	1	64	2020-03-11 23:43:43.134996	2020-03-11 23:43:43.134996
5028	50	1	65	2020-03-11 23:43:43.160696	2020-03-11 23:43:43.160696
5029	50	1	66	2020-03-11 23:43:43.187651	2020-03-11 23:43:43.187651
5030	50	1	67	2020-03-11 23:43:43.210607	2020-03-11 23:43:43.210607
5031	50	1	68	2020-03-11 23:43:43.226001	2020-03-11 23:43:43.226001
5032	50	1	69	2020-03-11 23:43:43.242077	2020-03-11 23:43:43.242077
5033	50	1	70	2020-03-11 23:43:43.25959	2020-03-11 23:43:43.25959
5034	50	1	71	2020-03-11 23:43:43.276572	2020-03-11 23:43:43.276572
5035	50	1	72	2020-03-11 23:43:43.290891	2020-03-11 23:43:43.290891
5036	50	1	73	2020-03-11 23:43:43.308113	2020-03-11 23:43:43.308113
5037	50	1	74	2020-03-11 23:43:43.3224	2020-03-11 23:43:43.3224
5038	50	1	1	2020-03-21 18:08:54.742858	2020-03-21 18:08:54.742858
5039	50	1	2	2020-03-21 18:08:54.82154	2020-03-21 18:08:54.82154
5040	50	1	3	2020-03-21 18:08:54.8332	2020-03-21 18:08:54.8332
5041	50	1	4	2020-03-21 18:08:54.889117	2020-03-21 18:08:54.889117
5042	50	1	5	2020-03-21 18:08:54.909508	2020-03-21 18:08:54.909508
5043	50	1	6	2020-03-21 18:08:54.924908	2020-03-21 18:08:54.924908
5044	50	1	7	2020-03-21 18:08:54.967444	2020-03-21 18:08:54.967444
5045	50	1	8	2020-03-21 18:08:54.995659	2020-03-21 18:08:54.995659
5046	50	1	9	2020-03-21 18:08:55.050364	2020-03-21 18:08:55.050364
5047	50	1	10	2020-03-21 18:08:55.066569	2020-03-21 18:08:55.066569
5048	50	1	11	2020-03-21 18:08:55.110237	2020-03-21 18:08:55.110237
5049	50	1	12	2020-03-21 18:08:55.138116	2020-03-21 18:08:55.138116
5050	50	1	13	2020-03-21 18:08:55.202243	2020-03-21 18:08:55.202243
5051	50	1	14	2020-03-21 18:08:55.217523	2020-03-21 18:08:55.217523
5052	50	1	15	2020-03-21 18:08:55.232843	2020-03-21 18:08:55.232843
5053	50	1	16	2020-03-21 18:08:55.249074	2020-03-21 18:08:55.249074
5054	50	1	17	2020-03-21 18:08:55.277405	2020-03-21 18:08:55.277405
5055	50	1	18	2020-03-21 18:08:55.30271	2020-03-21 18:08:55.30271
5056	50	1	19	2020-03-21 18:08:55.428576	2020-03-21 18:08:55.428576
5057	50	1	20	2020-03-21 18:08:55.446076	2020-03-21 18:08:55.446076
5058	50	1	21	2020-03-21 18:08:55.462995	2020-03-21 18:08:55.462995
5059	50	1	22	2020-03-21 18:08:55.483356	2020-03-21 18:08:55.483356
5060	50	1	23	2020-03-21 18:08:55.499618	2020-03-21 18:08:55.499618
5061	50	1	24	2020-03-21 18:08:55.556792	2020-03-21 18:08:55.556792
5062	50	1	25	2020-03-21 18:08:55.569476	2020-03-21 18:08:55.569476
5063	50	1	26	2020-03-21 18:08:55.599235	2020-03-21 18:08:55.599235
5064	50	1	27	2020-03-21 18:08:55.652023	2020-03-21 18:08:55.652023
5065	50	1	28	2020-03-21 18:08:55.678156	2020-03-21 18:08:55.678156
5066	50	1	29	2020-03-21 18:08:55.704834	2020-03-21 18:08:55.704834
5067	50	1	30	2020-03-21 18:08:55.716706	2020-03-21 18:08:55.716706
5068	50	1	31	2020-03-21 18:08:55.738454	2020-03-21 18:08:55.738454
5069	50	1	32	2020-03-21 18:08:55.755722	2020-03-21 18:08:55.755722
5070	50	1	33	2020-03-21 18:08:55.782762	2020-03-21 18:08:55.782762
5071	50	1	34	2020-03-21 18:08:55.801993	2020-03-21 18:08:55.801993
5072	50	1	35	2020-03-21 18:08:55.820144	2020-03-21 18:08:55.820144
5073	50	1	36	2020-03-21 18:08:55.835259	2020-03-21 18:08:55.835259
5074	50	1	37	2020-03-21 18:08:55.854482	2020-03-21 18:08:55.854482
5075	50	1	38	2020-03-21 18:08:55.876505	2020-03-21 18:08:55.876505
5076	50	1	39	2020-03-21 18:08:55.891432	2020-03-21 18:08:55.891432
5077	50	1	40	2020-03-21 18:08:55.918838	2020-03-21 18:08:55.918838
5078	50	1	41	2020-03-21 18:08:55.937289	2020-03-21 18:08:55.937289
5079	50	1	42	2020-03-21 18:08:55.959282	2020-03-21 18:08:55.959282
5080	50	1	43	2020-03-21 18:08:55.978412	2020-03-21 18:08:55.978412
5081	50	1	44	2020-03-21 18:08:55.998731	2020-03-21 18:08:55.998731
5082	50	1	45	2020-03-21 18:08:56.019038	2020-03-21 18:08:56.019038
5083	50	1	46	2020-03-21 18:08:56.04774	2020-03-21 18:08:56.04774
5084	50	1	47	2020-03-21 18:08:56.083262	2020-03-21 18:08:56.083262
5085	50	1	48	2020-03-21 18:08:56.107739	2020-03-21 18:08:56.107739
5086	50	1	49	2020-03-21 18:08:56.148858	2020-03-21 18:08:56.148858
5087	50	1	50	2020-03-21 18:08:56.168111	2020-03-21 18:08:56.168111
5088	50	1	51	2020-03-21 18:08:56.199718	2020-03-21 18:08:56.199718
5089	50	1	52	2020-03-21 18:08:56.219661	2020-03-21 18:08:56.219661
5090	50	1	53	2020-03-21 18:08:56.236759	2020-03-21 18:08:56.236759
5091	50	1	54	2020-03-21 18:08:56.257833	2020-03-21 18:08:56.257833
5092	50	1	55	2020-03-21 18:08:56.281066	2020-03-21 18:08:56.281066
5093	50	1	56	2020-03-21 18:08:56.299699	2020-03-21 18:08:56.299699
5094	50	1	57	2020-03-21 18:08:56.319856	2020-03-21 18:08:56.319856
5095	50	1	58	2020-03-21 18:08:56.333188	2020-03-21 18:08:56.333188
5096	50	1	59	2020-03-21 18:08:56.349947	2020-03-21 18:08:56.349947
5097	50	1	60	2020-03-21 18:08:56.37423	2020-03-21 18:08:56.37423
5098	50	1	61	2020-03-21 18:08:56.414203	2020-03-21 18:08:56.414203
5099	50	1	62	2020-03-21 18:08:56.424316	2020-03-21 18:08:56.424316
5100	50	1	63	2020-03-21 18:08:56.448822	2020-03-21 18:08:56.448822
5101	50	1	64	2020-03-21 18:08:56.466757	2020-03-21 18:08:56.466757
5102	50	1	65	2020-03-21 18:08:56.483011	2020-03-21 18:08:56.483011
5103	50	1	66	2020-03-21 18:08:56.501344	2020-03-21 18:08:56.501344
5104	50	1	67	2020-03-21 18:08:56.520071	2020-03-21 18:08:56.520071
5105	50	1	68	2020-03-21 18:08:56.534972	2020-03-21 18:08:56.534972
5106	50	1	69	2020-03-21 18:08:56.552773	2020-03-21 18:08:56.552773
5107	50	1	70	2020-03-21 18:08:56.570398	2020-03-21 18:08:56.570398
5108	50	1	71	2020-03-21 18:08:56.591837	2020-03-21 18:08:56.591837
5109	50	1	72	2020-03-21 18:08:56.608273	2020-03-21 18:08:56.608273
5110	50	1	73	2020-03-21 18:08:56.623157	2020-03-21 18:08:56.623157
5111	50	1	74	2020-03-21 18:08:56.648971	2020-03-21 18:08:56.648971
5112	50	1	1	2020-04-13 17:50:47.027428	2020-04-13 17:50:47.027428
5113	50	1	2	2020-04-13 17:50:47.255513	2020-04-13 17:50:47.255513
5114	50	1	3	2020-04-13 17:50:47.314221	2020-04-13 17:50:47.314221
5115	50	1	4	2020-04-13 17:50:47.383263	2020-04-13 17:50:47.383263
5116	50	1	5	2020-04-13 17:50:47.447786	2020-04-13 17:50:47.447786
5117	50	1	6	2020-04-13 17:50:47.692546	2020-04-13 17:50:47.692546
5118	50	1	7	2020-04-13 17:50:47.714901	2020-04-13 17:50:47.714901
5119	50	1	8	2020-04-13 17:50:47.729204	2020-04-13 17:50:47.729204
5120	50	1	9	2020-04-13 17:50:47.747274	2020-04-13 17:50:47.747274
5121	50	1	10	2020-04-13 17:50:47.794271	2020-04-13 17:50:47.794271
5122	50	1	11	2020-04-13 17:50:47.809078	2020-04-13 17:50:47.809078
5123	50	1	12	2020-04-13 17:50:47.827772	2020-04-13 17:50:47.827772
5124	50	1	13	2020-04-13 17:50:47.886589	2020-04-13 17:50:47.886589
5125	50	1	14	2020-04-13 17:50:47.918515	2020-04-13 17:50:47.918515
5126	50	1	15	2020-04-13 17:50:47.93644	2020-04-13 17:50:47.93644
5127	50	1	16	2020-04-13 17:50:47.965576	2020-04-13 17:50:47.965576
5128	50	1	17	2020-04-13 17:50:47.993759	2020-04-13 17:50:47.993759
5129	50	1	18	2020-04-13 17:50:48.006381	2020-04-13 17:50:48.006381
5130	50	1	19	2020-04-13 17:50:48.01973	2020-04-13 17:50:48.01973
5131	50	1	20	2020-04-13 17:50:48.072973	2020-04-13 17:50:48.072973
5132	50	1	21	2020-04-13 17:50:48.087577	2020-04-13 17:50:48.087577
5133	50	1	22	2020-04-13 17:50:48.099133	2020-04-13 17:50:48.099133
5134	50	1	23	2020-04-13 17:50:48.111469	2020-04-13 17:50:48.111469
5135	50	1	24	2020-04-13 17:50:48.123146	2020-04-13 17:50:48.123146
5136	50	1	25	2020-04-13 17:50:48.134212	2020-04-13 17:50:48.134212
5137	50	1	26	2020-04-13 17:50:48.147603	2020-04-13 17:50:48.147603
5138	50	1	27	2020-04-13 17:50:48.15985	2020-04-13 17:50:48.15985
5139	50	1	28	2020-04-13 17:50:48.171178	2020-04-13 17:50:48.171178
5140	50	1	29	2020-04-13 17:50:48.187161	2020-04-13 17:50:48.187161
5141	50	1	30	2020-04-13 17:50:48.204694	2020-04-13 17:50:48.204694
5142	50	1	31	2020-04-13 17:50:48.257787	2020-04-13 17:50:48.257787
5143	50	1	32	2020-04-13 17:50:48.273578	2020-04-13 17:50:48.273578
5144	50	1	33	2020-04-13 17:50:48.28482	2020-04-13 17:50:48.28482
5145	50	1	34	2020-04-13 17:50:48.37015	2020-04-13 17:50:48.37015
5146	50	1	35	2020-04-13 17:50:48.388082	2020-04-13 17:50:48.388082
5147	50	1	36	2020-04-13 17:50:48.402717	2020-04-13 17:50:48.402717
5148	50	1	37	2020-04-13 17:50:48.420107	2020-04-13 17:50:48.420107
5149	50	1	38	2020-04-13 17:50:48.436426	2020-04-13 17:50:48.436426
5150	50	1	39	2020-04-13 17:50:48.467572	2020-04-13 17:50:48.467572
5151	50	1	40	2020-04-13 17:50:48.482043	2020-04-13 17:50:48.482043
5152	50	1	41	2020-04-13 17:50:48.497386	2020-04-13 17:50:48.497386
5153	50	1	42	2020-04-13 17:50:48.513156	2020-04-13 17:50:48.513156
5154	50	1	43	2020-04-13 17:50:48.532931	2020-04-13 17:50:48.532931
5155	50	1	44	2020-04-13 17:50:48.548219	2020-04-13 17:50:48.548219
5156	50	1	45	2020-04-13 17:50:48.559895	2020-04-13 17:50:48.559895
5157	50	1	46	2020-04-13 17:50:48.571296	2020-04-13 17:50:48.571296
5158	50	1	47	2020-04-13 17:50:48.582007	2020-04-13 17:50:48.582007
5159	50	1	48	2020-04-13 17:50:48.593692	2020-04-13 17:50:48.593692
5160	50	1	49	2020-04-13 17:50:48.604603	2020-04-13 17:50:48.604603
5161	50	1	50	2020-04-13 17:50:48.616354	2020-04-13 17:50:48.616354
5162	50	1	51	2020-04-13 17:50:48.63184	2020-04-13 17:50:48.63184
5163	50	1	52	2020-04-13 17:50:48.68697	2020-04-13 17:50:48.68697
5164	50	1	53	2020-04-13 17:50:48.699974	2020-04-13 17:50:48.699974
5165	50	1	54	2020-04-13 17:50:48.710545	2020-04-13 17:50:48.710545
5166	50	1	55	2020-04-13 17:50:48.721898	2020-04-13 17:50:48.721898
5167	50	1	56	2020-04-13 17:50:48.734016	2020-04-13 17:50:48.734016
5168	50	1	57	2020-04-13 17:50:48.743985	2020-04-13 17:50:48.743985
5169	50	1	58	2020-04-13 17:50:48.755321	2020-04-13 17:50:48.755321
5170	50	1	59	2020-04-13 17:50:48.767322	2020-04-13 17:50:48.767322
5171	50	1	60	2020-04-13 17:50:48.788077	2020-04-13 17:50:48.788077
5172	50	1	61	2020-04-13 17:50:48.799158	2020-04-13 17:50:48.799158
5173	50	1	62	2020-04-13 17:50:48.809053	2020-04-13 17:50:48.809053
5174	50	1	63	2020-04-13 17:50:48.820725	2020-04-13 17:50:48.820725
5175	50	1	64	2020-04-13 17:50:48.832228	2020-04-13 17:50:48.832228
5176	50	1	65	2020-04-13 17:50:48.843165	2020-04-13 17:50:48.843165
5177	50	1	66	2020-04-13 17:50:48.854288	2020-04-13 17:50:48.854288
5178	50	1	67	2020-04-13 17:50:48.86608	2020-04-13 17:50:48.86608
5179	50	1	68	2020-04-13 17:50:48.877293	2020-04-13 17:50:48.877293
5180	50	1	69	2020-04-13 17:50:48.892731	2020-04-13 17:50:48.892731
5181	50	1	70	2020-04-13 17:50:48.907788	2020-04-13 17:50:48.907788
5182	50	1	71	2020-04-13 17:50:48.919962	2020-04-13 17:50:48.919962
5183	50	1	72	2020-04-13 17:50:48.931847	2020-04-13 17:50:48.931847
5184	68	1	73	2020-04-13 17:50:48.944299	2020-04-13 17:50:48.944299
5185	42	1	74	2020-04-13 17:50:48.9565	2020-04-13 17:50:48.9565
5186	50	1	1	2020-04-16 04:03:51.865195	2020-04-16 04:03:51.865195
5187	50	1	2	2020-04-16 04:03:51.948419	2020-04-16 04:03:51.948419
5188	50	1	3	2020-04-16 04:03:51.961171	2020-04-16 04:03:51.961171
5189	50	1	4	2020-04-16 04:03:51.975974	2020-04-16 04:03:51.975974
5190	50	1	5	2020-04-16 04:03:51.98775	2020-04-16 04:03:51.98775
5191	50	1	6	2020-04-16 04:03:52.000982	2020-04-16 04:03:52.000982
5192	50	1	7	2020-04-16 04:03:52.01256	2020-04-16 04:03:52.01256
5193	50	1	8	2020-04-16 04:03:52.023937	2020-04-16 04:03:52.023937
5194	50	1	9	2020-04-16 04:03:52.037158	2020-04-16 04:03:52.037158
5195	50	1	10	2020-04-16 04:03:52.051424	2020-04-16 04:03:52.051424
5196	50	1	11	2020-04-16 04:03:52.067101	2020-04-16 04:03:52.067101
5197	50	1	12	2020-04-16 04:03:52.079489	2020-04-16 04:03:52.079489
5198	50	1	13	2020-04-16 04:03:52.096359	2020-04-16 04:03:52.096359
5199	50	1	14	2020-04-16 04:03:52.115493	2020-04-16 04:03:52.115493
5200	50	1	15	2020-04-16 04:03:52.127992	2020-04-16 04:03:52.127992
5201	50	1	16	2020-04-16 04:03:52.139838	2020-04-16 04:03:52.139838
5202	50	1	17	2020-04-16 04:03:52.153987	2020-04-16 04:03:52.153987
5203	50	1	18	2020-04-16 04:03:52.173456	2020-04-16 04:03:52.173456
5204	50	1	19	2020-04-16 04:03:52.188443	2020-04-16 04:03:52.188443
5205	50	1	20	2020-04-16 04:03:52.248937	2020-04-16 04:03:52.248937
5206	50	1	21	2020-04-16 04:03:52.313063	2020-04-16 04:03:52.313063
5207	50	1	22	2020-04-16 04:03:52.329652	2020-04-16 04:03:52.329652
5208	50	1	23	2020-04-16 04:03:52.54002	2020-04-16 04:03:52.54002
5209	50	1	24	2020-04-16 04:03:52.59377	2020-04-16 04:03:52.59377
5210	50	1	25	2020-04-16 04:03:52.60401	2020-04-16 04:03:52.60401
5211	50	1	26	2020-04-16 04:03:52.616779	2020-04-16 04:03:52.616779
5212	50	1	27	2020-04-16 04:03:52.634998	2020-04-16 04:03:52.634998
5213	50	1	28	2020-04-16 04:03:52.651313	2020-04-16 04:03:52.651313
5214	50	1	29	2020-04-16 04:03:52.668351	2020-04-16 04:03:52.668351
5215	50	1	30	2020-04-16 04:03:52.89099	2020-04-16 04:03:52.89099
5216	50	1	31	2020-04-16 04:03:52.969838	2020-04-16 04:03:52.969838
5217	50	1	32	2020-04-16 04:03:52.998686	2020-04-16 04:03:52.998686
5218	50	1	33	2020-04-16 04:03:53.182754	2020-04-16 04:03:53.182754
5219	50	1	34	2020-04-16 04:03:53.250362	2020-04-16 04:03:53.250362
5220	50	1	35	2020-04-16 04:03:53.279701	2020-04-16 04:03:53.279701
5221	50	1	36	2020-04-16 04:03:53.300886	2020-04-16 04:03:53.300886
5222	50	1	37	2020-04-16 04:03:53.31928	2020-04-16 04:03:53.31928
5223	50	1	38	2020-04-16 04:03:53.33699	2020-04-16 04:03:53.33699
5224	50	1	39	2020-04-16 04:03:53.350158	2020-04-16 04:03:53.350158
5225	50	1	40	2020-04-16 04:03:53.367975	2020-04-16 04:03:53.367975
5226	50	1	41	2020-04-16 04:03:53.387296	2020-04-16 04:03:53.387296
5227	50	1	42	2020-04-16 04:03:53.496717	2020-04-16 04:03:53.496717
5228	50	1	43	2020-04-16 04:03:53.515534	2020-04-16 04:03:53.515534
5229	50	1	44	2020-04-16 04:03:53.536407	2020-04-16 04:03:53.536407
5230	50	1	45	2020-04-16 04:03:53.55632	2020-04-16 04:03:53.55632
5231	50	1	46	2020-04-16 04:03:53.589929	2020-04-16 04:03:53.589929
5232	50	1	47	2020-04-16 04:03:53.612679	2020-04-16 04:03:53.612679
5233	50	1	48	2020-04-16 04:03:53.633996	2020-04-16 04:03:53.633996
5234	50	1	49	2020-04-16 04:03:53.701521	2020-04-16 04:03:53.701521
5235	50	1	50	2020-04-16 04:03:53.721047	2020-04-16 04:03:53.721047
5236	50	1	51	2020-04-16 04:03:53.765384	2020-04-16 04:03:53.765384
5237	50	1	52	2020-04-16 04:03:53.78557	2020-04-16 04:03:53.78557
5238	50	1	53	2020-04-16 04:03:53.805037	2020-04-16 04:03:53.805037
5239	50	1	54	2020-04-16 04:03:53.818758	2020-04-16 04:03:53.818758
5240	50	1	55	2020-04-16 04:03:53.83213	2020-04-16 04:03:53.83213
5241	50	1	56	2020-04-16 04:03:53.850305	2020-04-16 04:03:53.850305
5242	50	1	57	2020-04-16 04:03:53.865489	2020-04-16 04:03:53.865489
5243	50	1	58	2020-04-16 04:03:53.880647	2020-04-16 04:03:53.880647
5244	50	1	59	2020-04-16 04:03:53.979468	2020-04-16 04:03:53.979468
5245	50	1	60	2020-04-16 04:03:54.014928	2020-04-16 04:03:54.014928
5246	50	1	61	2020-04-16 04:03:54.034711	2020-04-16 04:03:54.034711
5247	50	1	62	2020-04-16 04:03:54.051966	2020-04-16 04:03:54.051966
5248	50	1	63	2020-04-16 04:03:54.073732	2020-04-16 04:03:54.073732
5249	50	1	64	2020-04-16 04:03:54.092856	2020-04-16 04:03:54.092856
5250	50	1	65	2020-04-16 04:03:54.116118	2020-04-16 04:03:54.116118
5251	50	1	66	2020-04-16 04:03:54.132362	2020-04-16 04:03:54.132362
5252	50	1	67	2020-04-16 04:03:54.286043	2020-04-16 04:03:54.286043
5253	50	1	68	2020-04-16 04:03:54.301913	2020-04-16 04:03:54.301913
5254	50	1	69	2020-04-16 04:03:54.317321	2020-04-16 04:03:54.317321
5255	50	1	70	2020-04-16 04:03:54.339168	2020-04-16 04:03:54.339168
5256	50	1	71	2020-04-16 04:03:54.362485	2020-04-16 04:03:54.362485
5257	50	1	72	2020-04-16 04:03:54.382825	2020-04-16 04:03:54.382825
5258	50	1	73	2020-04-16 04:03:54.397213	2020-04-16 04:03:54.397213
5259	50	1	74	2020-04-16 04:03:54.407152	2020-04-16 04:03:54.407152
5260	50	1	1	2020-04-16 04:47:56.004406	2020-04-16 04:47:56.004406
5261	50	1	2	2020-04-16 04:47:56.061806	2020-04-16 04:47:56.061806
5262	50	1	3	2020-04-16 04:47:56.074716	2020-04-16 04:47:56.074716
5263	50	1	4	2020-04-16 04:47:56.084627	2020-04-16 04:47:56.084627
5264	50	1	5	2020-04-16 04:47:56.096866	2020-04-16 04:47:56.096866
5265	50	1	6	2020-04-16 04:47:56.113596	2020-04-16 04:47:56.113596
5266	50	1	7	2020-04-16 04:47:56.126125	2020-04-16 04:47:56.126125
5267	50	1	8	2020-04-16 04:47:56.138728	2020-04-16 04:47:56.138728
5268	50	1	9	2020-04-16 04:47:56.151526	2020-04-16 04:47:56.151526
5269	50	1	10	2020-04-16 04:47:56.165142	2020-04-16 04:47:56.165142
5270	50	1	11	2020-04-16 04:47:56.179477	2020-04-16 04:47:56.179477
5271	50	1	12	2020-04-16 04:47:56.190577	2020-04-16 04:47:56.190577
5272	50	1	13	2020-04-16 04:47:56.20092	2020-04-16 04:47:56.20092
5273	50	1	14	2020-04-16 04:47:56.211445	2020-04-16 04:47:56.211445
5274	50	1	15	2020-04-16 04:47:56.221971	2020-04-16 04:47:56.221971
5275	50	1	16	2020-04-16 04:47:56.232665	2020-04-16 04:47:56.232665
5276	50	1	17	2020-04-16 04:47:56.242984	2020-04-16 04:47:56.242984
5277	50	1	18	2020-04-16 04:47:56.256763	2020-04-16 04:47:56.256763
5278	50	1	19	2020-04-16 04:47:56.270496	2020-04-16 04:47:56.270496
5279	50	1	20	2020-04-16 04:47:56.28168	2020-04-16 04:47:56.28168
5280	50	1	21	2020-04-16 04:47:56.292934	2020-04-16 04:47:56.292934
5281	50	1	22	2020-04-16 04:47:56.303899	2020-04-16 04:47:56.303899
5282	50	1	23	2020-04-16 04:47:56.315181	2020-04-16 04:47:56.315181
5283	50	1	24	2020-04-16 04:47:56.326777	2020-04-16 04:47:56.326777
5284	50	1	25	2020-04-16 04:47:56.33916	2020-04-16 04:47:56.33916
5285	50	1	26	2020-04-16 04:47:56.351448	2020-04-16 04:47:56.351448
5286	50	1	27	2020-04-16 04:47:56.370322	2020-04-16 04:47:56.370322
5287	50	1	28	2020-04-16 04:47:56.383448	2020-04-16 04:47:56.383448
5288	50	1	29	2020-04-16 04:47:56.39544	2020-04-16 04:47:56.39544
5289	50	1	30	2020-04-16 04:47:56.407375	2020-04-16 04:47:56.407375
5290	50	1	31	2020-04-16 04:47:56.424915	2020-04-16 04:47:56.424915
5291	50	1	32	2020-04-16 04:47:56.43559	2020-04-16 04:47:56.43559
5292	50	1	33	2020-04-16 04:47:56.449149	2020-04-16 04:47:56.449149
5293	50	1	34	2020-04-16 04:47:56.459867	2020-04-16 04:47:56.459867
5294	50	1	35	2020-04-16 04:47:56.472174	2020-04-16 04:47:56.472174
5295	50	1	36	2020-04-16 04:47:56.48237	2020-04-16 04:47:56.48237
5296	50	1	37	2020-04-16 04:47:56.491799	2020-04-16 04:47:56.491799
5297	50	1	38	2020-04-16 04:47:56.501036	2020-04-16 04:47:56.501036
5298	50	1	39	2020-04-16 04:47:56.511251	2020-04-16 04:47:56.511251
5299	50	1	40	2020-04-16 04:47:56.520629	2020-04-16 04:47:56.520629
5300	50	1	41	2020-04-16 04:47:56.532705	2020-04-16 04:47:56.532705
5301	50	1	42	2020-04-16 04:47:56.54288	2020-04-16 04:47:56.54288
5302	50	1	43	2020-04-16 04:47:56.552744	2020-04-16 04:47:56.552744
5303	50	1	44	2020-04-16 04:47:56.563938	2020-04-16 04:47:56.563938
5304	50	1	45	2020-04-16 04:47:56.577367	2020-04-16 04:47:56.577367
5305	50	1	46	2020-04-16 04:47:56.588008	2020-04-16 04:47:56.588008
5306	50	1	47	2020-04-16 04:47:56.600156	2020-04-16 04:47:56.600156
5307	50	1	48	2020-04-16 04:47:56.610894	2020-04-16 04:47:56.610894
5308	50	1	49	2020-04-16 04:47:56.623368	2020-04-16 04:47:56.623368
5309	50	1	50	2020-04-16 04:47:56.634519	2020-04-16 04:47:56.634519
5310	50	1	51	2020-04-16 04:47:56.646018	2020-04-16 04:47:56.646018
5311	50	1	52	2020-04-16 04:47:56.660553	2020-04-16 04:47:56.660553
5312	50	1	53	2020-04-16 04:47:56.676845	2020-04-16 04:47:56.676845
5313	50	1	54	2020-04-16 04:47:56.692334	2020-04-16 04:47:56.692334
5314	50	1	55	2020-04-16 04:47:56.702459	2020-04-16 04:47:56.702459
5315	50	1	56	2020-04-16 04:47:56.718244	2020-04-16 04:47:56.718244
5316	50	1	57	2020-04-16 04:47:56.747491	2020-04-16 04:47:56.747491
5317	50	1	58	2020-04-16 04:47:56.761164	2020-04-16 04:47:56.761164
5318	50	1	59	2020-04-16 04:47:56.79307	2020-04-16 04:47:56.79307
5319	50	1	60	2020-04-16 04:47:56.808254	2020-04-16 04:47:56.808254
5320	50	1	61	2020-04-16 04:47:56.819311	2020-04-16 04:47:56.819311
5321	50	1	62	2020-04-16 04:47:56.832879	2020-04-16 04:47:56.832879
5322	50	1	63	2020-04-16 04:47:56.844925	2020-04-16 04:47:56.844925
5323	50	1	64	2020-04-16 04:47:56.857703	2020-04-16 04:47:56.857703
5324	50	1	65	2020-04-16 04:47:56.875878	2020-04-16 04:47:56.875878
5325	50	1	66	2020-04-16 04:47:56.890986	2020-04-16 04:47:56.890986
5326	50	1	67	2020-04-16 04:47:56.90884	2020-04-16 04:47:56.90884
5327	50	1	68	2020-04-16 04:47:56.924198	2020-04-16 04:47:56.924198
5328	50	1	69	2020-04-16 04:47:56.935173	2020-04-16 04:47:56.935173
5329	50	1	70	2020-04-16 04:47:56.952755	2020-04-16 04:47:56.952755
5330	50	1	71	2020-04-16 04:47:56.977435	2020-04-16 04:47:56.977435
5331	50	1	72	2020-04-16 04:47:56.993617	2020-04-16 04:47:56.993617
5332	50	1	73	2020-04-16 04:47:57.007459	2020-04-16 04:47:57.007459
5333	50	1	74	2020-04-16 04:47:57.022225	2020-04-16 04:47:57.022225
5334	50	1	1	2020-04-16 04:54:19.003259	2020-04-16 04:54:19.003259
5335	50	1	2	2020-04-16 04:54:19.017284	2020-04-16 04:54:19.017284
5336	50	1	3	2020-04-16 04:54:19.027724	2020-04-16 04:54:19.027724
5337	50	1	4	2020-04-16 04:54:19.045243	2020-04-16 04:54:19.045243
5338	50	1	5	2020-04-16 04:54:19.062466	2020-04-16 04:54:19.062466
5339	50	1	6	2020-04-16 04:54:19.084392	2020-04-16 04:54:19.084392
5340	50	1	7	2020-04-16 04:54:19.102583	2020-04-16 04:54:19.102583
5341	50	1	8	2020-04-16 04:54:19.127789	2020-04-16 04:54:19.127789
5342	50	1	9	2020-04-16 04:54:19.146481	2020-04-16 04:54:19.146481
5343	50	1	10	2020-04-16 04:54:19.168008	2020-04-16 04:54:19.168008
5344	50	1	11	2020-04-16 04:54:19.185201	2020-04-16 04:54:19.185201
5345	50	1	12	2020-04-16 04:54:19.200516	2020-04-16 04:54:19.200516
5346	50	1	13	2020-04-16 04:54:19.213514	2020-04-16 04:54:19.213514
5347	50	1	14	2020-04-16 04:54:19.229559	2020-04-16 04:54:19.229559
5348	50	1	15	2020-04-16 04:54:19.244463	2020-04-16 04:54:19.244463
5349	50	1	16	2020-04-16 04:54:19.2601	2020-04-16 04:54:19.2601
5350	50	1	17	2020-04-16 04:54:19.270368	2020-04-16 04:54:19.270368
5351	50	1	18	2020-04-16 04:54:19.286848	2020-04-16 04:54:19.286848
5352	50	1	19	2020-04-16 04:54:19.301408	2020-04-16 04:54:19.301408
5353	50	1	20	2020-04-16 04:54:19.316146	2020-04-16 04:54:19.316146
5354	50	1	21	2020-04-16 04:54:19.330158	2020-04-16 04:54:19.330158
5355	50	1	22	2020-04-16 04:54:19.34647	2020-04-16 04:54:19.34647
5356	50	1	23	2020-04-16 04:54:19.362045	2020-04-16 04:54:19.362045
5357	50	1	24	2020-04-16 04:54:19.378236	2020-04-16 04:54:19.378236
5358	50	1	25	2020-04-16 04:54:19.394176	2020-04-16 04:54:19.394176
5359	50	1	26	2020-04-16 04:54:19.410767	2020-04-16 04:54:19.410767
5360	50	1	27	2020-04-16 04:54:19.426307	2020-04-16 04:54:19.426307
5361	50	1	28	2020-04-16 04:54:19.44324	2020-04-16 04:54:19.44324
5362	50	1	29	2020-04-16 04:54:19.462053	2020-04-16 04:54:19.462053
5363	50	1	30	2020-04-16 04:54:19.47857	2020-04-16 04:54:19.47857
5364	50	1	31	2020-04-16 04:54:19.494678	2020-04-16 04:54:19.494678
5365	50	1	32	2020-04-16 04:54:19.510776	2020-04-16 04:54:19.510776
5366	50	1	33	2020-04-16 04:54:19.531843	2020-04-16 04:54:19.531843
5367	50	1	34	2020-04-16 04:54:19.550571	2020-04-16 04:54:19.550571
5368	50	1	35	2020-04-16 04:54:19.568222	2020-04-16 04:54:19.568222
5369	50	1	36	2020-04-16 04:54:19.584408	2020-04-16 04:54:19.584408
5370	50	1	37	2020-04-16 04:54:19.602827	2020-04-16 04:54:19.602827
5371	50	1	38	2020-04-16 04:54:19.618844	2020-04-16 04:54:19.618844
5372	50	1	39	2020-04-16 04:54:19.637609	2020-04-16 04:54:19.637609
5373	50	1	40	2020-04-16 04:54:19.655219	2020-04-16 04:54:19.655219
5374	50	1	41	2020-04-16 04:54:19.674911	2020-04-16 04:54:19.674911
5375	50	1	42	2020-04-16 04:54:19.688529	2020-04-16 04:54:19.688529
5376	50	1	43	2020-04-16 04:54:19.710651	2020-04-16 04:54:19.710651
5377	50	1	44	2020-04-16 04:54:19.72469	2020-04-16 04:54:19.72469
5378	50	1	45	2020-04-16 04:54:19.753366	2020-04-16 04:54:19.753366
5379	50	1	46	2020-04-16 04:54:19.772802	2020-04-16 04:54:19.772802
5380	50	1	47	2020-04-16 04:54:19.797334	2020-04-16 04:54:19.797334
5381	50	1	48	2020-04-16 04:54:19.815487	2020-04-16 04:54:19.815487
5382	50	1	49	2020-04-16 04:54:19.832609	2020-04-16 04:54:19.832609
5383	50	1	50	2020-04-16 04:54:19.853336	2020-04-16 04:54:19.853336
5384	50	1	51	2020-04-16 04:54:19.867614	2020-04-16 04:54:19.867614
5385	50	1	52	2020-04-16 04:54:19.883517	2020-04-16 04:54:19.883517
5386	50	1	53	2020-04-16 04:54:19.898941	2020-04-16 04:54:19.898941
5387	50	1	54	2020-04-16 04:54:19.913972	2020-04-16 04:54:19.913972
5388	50	1	55	2020-04-16 04:54:19.928172	2020-04-16 04:54:19.928172
5389	50	1	56	2020-04-16 04:54:19.941351	2020-04-16 04:54:19.941351
5390	50	1	57	2020-04-16 04:54:19.957033	2020-04-16 04:54:19.957033
5391	50	1	58	2020-04-16 04:54:19.970409	2020-04-16 04:54:19.970409
5392	50	1	59	2020-04-16 04:54:19.986573	2020-04-16 04:54:19.986573
5393	50	1	60	2020-04-16 04:54:20.00363	2020-04-16 04:54:20.00363
5394	50	1	61	2020-04-16 04:54:20.033899	2020-04-16 04:54:20.033899
5395	50	1	62	2020-04-16 04:54:20.053974	2020-04-16 04:54:20.053974
5396	50	1	63	2020-04-16 04:54:20.080852	2020-04-16 04:54:20.080852
5397	50	1	64	2020-04-16 04:54:20.097718	2020-04-16 04:54:20.097718
5398	50	1	65	2020-04-16 04:54:20.116211	2020-04-16 04:54:20.116211
5399	50	1	66	2020-04-16 04:54:20.134771	2020-04-16 04:54:20.134771
5400	50	1	67	2020-04-16 04:54:20.151146	2020-04-16 04:54:20.151146
5401	50	1	68	2020-04-16 04:54:20.168496	2020-04-16 04:54:20.168496
5402	50	1	69	2020-04-16 04:54:20.187026	2020-04-16 04:54:20.187026
5403	50	1	70	2020-04-16 04:54:20.218352	2020-04-16 04:54:20.218352
5404	50	1	71	2020-04-16 04:54:20.252799	2020-04-16 04:54:20.252799
5405	50	1	72	2020-04-16 04:54:20.266611	2020-04-16 04:54:20.266611
5406	50	1	73	2020-04-16 04:54:20.283177	2020-04-16 04:54:20.283177
5407	50	1	74	2020-04-16 04:54:20.298576	2020-04-16 04:54:20.298576
5408	53	1	1	2020-04-24 17:36:34.208843	2020-04-24 17:36:34.208843
5409	50	1	2	2020-04-24 17:36:34.413261	2020-04-24 17:36:34.413261
5410	50	1	3	2020-04-24 17:36:34.464345	2020-04-24 17:36:34.464345
5411	50	1	4	2020-04-24 17:36:34.532804	2020-04-24 17:36:34.532804
5412	50	1	5	2020-04-24 17:36:34.563729	2020-04-24 17:36:34.563729
5413	50	1	6	2020-04-24 17:36:34.597406	2020-04-24 17:36:34.597406
5414	50	1	7	2020-04-24 17:36:34.634519	2020-04-24 17:36:34.634519
5415	50	1	8	2020-04-24 17:36:34.73078	2020-04-24 17:36:34.73078
5416	50	1	9	2020-04-24 17:36:34.841861	2020-04-24 17:36:34.841861
5417	50	1	10	2020-04-24 17:36:34.887142	2020-04-24 17:36:34.887142
5418	50	1	11	2020-04-24 17:36:34.904581	2020-04-24 17:36:34.904581
5419	50	1	12	2020-04-24 17:36:34.924728	2020-04-24 17:36:34.924728
5420	50	1	13	2020-04-24 17:36:34.952278	2020-04-24 17:36:34.952278
5421	50	1	14	2020-04-24 17:36:34.968197	2020-04-24 17:36:34.968197
5422	50	1	15	2020-04-24 17:36:34.995498	2020-04-24 17:36:34.995498
5423	50	1	16	2020-04-24 17:36:35.020525	2020-04-24 17:36:35.020525
5424	50	1	17	2020-04-24 17:36:35.05229	2020-04-24 17:36:35.05229
5425	50	1	18	2020-04-24 17:36:35.073895	2020-04-24 17:36:35.073895
5426	50	1	19	2020-04-24 17:36:35.096216	2020-04-24 17:36:35.096216
5427	50	1	20	2020-04-24 17:36:35.135955	2020-04-24 17:36:35.135955
5428	50	1	21	2020-04-24 17:36:35.159051	2020-04-24 17:36:35.159051
5429	50	1	22	2020-04-24 17:36:35.183169	2020-04-24 17:36:35.183169
5430	50	1	23	2020-04-24 17:36:35.213606	2020-04-24 17:36:35.213606
5431	50	1	24	2020-04-24 17:36:35.231109	2020-04-24 17:36:35.231109
5432	50	1	25	2020-04-24 17:36:35.252372	2020-04-24 17:36:35.252372
5433	50	1	26	2020-04-24 17:36:35.288819	2020-04-24 17:36:35.288819
5434	50	1	27	2020-04-24 17:36:35.30865	2020-04-24 17:36:35.30865
5435	50	1	28	2020-04-24 17:36:35.340424	2020-04-24 17:36:35.340424
5436	50	1	29	2020-04-24 17:36:35.373523	2020-04-24 17:36:35.373523
5437	50	1	30	2020-04-24 17:36:35.402839	2020-04-24 17:36:35.402839
5438	50	1	31	2020-04-24 17:36:35.42674	2020-04-24 17:36:35.42674
5439	50	1	32	2020-04-24 17:36:35.470157	2020-04-24 17:36:35.470157
5440	50	1	33	2020-04-24 17:36:35.498729	2020-04-24 17:36:35.498729
5441	50	1	34	2020-04-24 17:36:35.526014	2020-04-24 17:36:35.526014
5442	50	1	35	2020-04-24 17:36:35.550094	2020-04-24 17:36:35.550094
5443	50	1	36	2020-04-24 17:36:35.570213	2020-04-24 17:36:35.570213
5444	50	1	37	2020-04-24 17:36:35.59014	2020-04-24 17:36:35.59014
5445	50	1	38	2020-04-24 17:36:35.625332	2020-04-24 17:36:35.625332
5446	50	1	39	2020-04-24 17:36:35.66007	2020-04-24 17:36:35.66007
5447	50	1	40	2020-04-24 17:36:35.6933	2020-04-24 17:36:35.6933
5448	50	1	41	2020-04-24 17:36:35.716973	2020-04-24 17:36:35.716973
5449	50	1	42	2020-04-24 17:36:35.741104	2020-04-24 17:36:35.741104
5450	50	1	43	2020-04-24 17:36:35.771337	2020-04-24 17:36:35.771337
5451	50	1	44	2020-04-24 17:36:35.793957	2020-04-24 17:36:35.793957
5452	50	1	45	2020-04-24 17:36:35.813822	2020-04-24 17:36:35.813822
5453	50	1	46	2020-04-24 17:36:35.85621	2020-04-24 17:36:35.85621
5454	50	1	47	2020-04-24 17:36:35.886735	2020-04-24 17:36:35.886735
5455	50	1	48	2020-04-24 17:36:35.925681	2020-04-24 17:36:35.925681
5456	50	1	49	2020-04-24 17:36:35.96064	2020-04-24 17:36:35.96064
5457	50	1	50	2020-04-24 17:36:35.996838	2020-04-24 17:36:35.996838
5458	50	1	51	2020-04-24 17:36:36.022596	2020-04-24 17:36:36.022596
5459	50	1	52	2020-04-24 17:36:36.054803	2020-04-24 17:36:36.054803
5460	50	1	53	2020-04-24 17:36:36.08729	2020-04-24 17:36:36.08729
5461	50	1	54	2020-04-24 17:36:36.123906	2020-04-24 17:36:36.123906
5462	50	1	55	2020-04-24 17:36:36.158418	2020-04-24 17:36:36.158418
5463	50	1	56	2020-04-24 17:36:36.189104	2020-04-24 17:36:36.189104
5464	50	1	57	2020-04-24 17:36:36.208147	2020-04-24 17:36:36.208147
5465	50	1	58	2020-04-24 17:36:36.229498	2020-04-24 17:36:36.229498
5466	50	1	59	2020-04-24 17:36:36.258385	2020-04-24 17:36:36.258385
5467	50	1	60	2020-04-24 17:36:36.276683	2020-04-24 17:36:36.276683
5468	50	1	61	2020-04-24 17:36:36.302481	2020-04-24 17:36:36.302481
5469	50	1	62	2020-04-24 17:36:36.327556	2020-04-24 17:36:36.327556
5470	50	1	63	2020-04-24 17:36:36.357006	2020-04-24 17:36:36.357006
5471	50	1	64	2020-04-24 17:36:36.376468	2020-04-24 17:36:36.376468
5472	50	1	65	2020-04-24 17:36:36.395809	2020-04-24 17:36:36.395809
5473	50	1	66	2020-04-24 17:36:36.439308	2020-04-24 17:36:36.439308
5474	50	1	67	2020-04-24 17:36:36.46196	2020-04-24 17:36:36.46196
5475	50	1	68	2020-04-24 17:36:36.541724	2020-04-24 17:36:36.541724
5476	50	1	69	2020-04-24 17:36:36.57333	2020-04-24 17:36:36.57333
5477	50	1	70	2020-04-24 17:36:36.609191	2020-04-24 17:36:36.609191
5478	50	1	71	2020-04-24 17:36:36.633296	2020-04-24 17:36:36.633296
5479	50	1	72	2020-04-24 17:36:36.653142	2020-04-24 17:36:36.653142
5480	50	1	73	2020-04-24 17:36:36.665917	2020-04-24 17:36:36.665917
5481	20	1	74	2020-04-24 17:36:36.693349	2020-04-24 17:36:36.693349
5482	50	1	1	2020-04-27 19:17:03.675822	2020-04-27 19:17:03.675822
5483	50	1	2	2020-04-27 19:17:03.715595	2020-04-27 19:17:03.715595
5484	50	1	3	2020-04-27 19:17:03.777904	2020-04-27 19:17:03.777904
5485	50	1	4	2020-04-27 19:17:03.840901	2020-04-27 19:17:03.840901
5486	50	1	5	2020-04-27 19:17:03.861435	2020-04-27 19:17:03.861435
5487	50	1	6	2020-04-27 19:17:03.875805	2020-04-27 19:17:03.875805
5488	50	1	7	2020-04-27 19:17:03.890797	2020-04-27 19:17:03.890797
5489	50	1	8	2020-04-27 19:17:03.903837	2020-04-27 19:17:03.903837
5490	50	1	9	2020-04-27 19:17:03.916861	2020-04-27 19:17:03.916861
5491	50	1	10	2020-04-27 19:17:03.9277	2020-04-27 19:17:03.9277
5492	50	1	11	2020-04-27 19:17:03.942289	2020-04-27 19:17:03.942289
5493	50	1	12	2020-04-27 19:17:03.958986	2020-04-27 19:17:03.958986
5494	50	1	13	2020-04-27 19:17:03.973226	2020-04-27 19:17:03.973226
5495	50	1	14	2020-04-27 19:17:03.98508	2020-04-27 19:17:03.98508
5496	50	1	15	2020-04-27 19:17:04.006638	2020-04-27 19:17:04.006638
5497	50	1	16	2020-04-27 19:17:04.034995	2020-04-27 19:17:04.034995
5498	50	1	17	2020-04-27 19:17:04.057385	2020-04-27 19:17:04.057385
5499	50	1	18	2020-04-27 19:17:04.076373	2020-04-27 19:17:04.076373
5500	50	1	19	2020-04-27 19:17:04.100433	2020-04-27 19:17:04.100433
5501	50	1	20	2020-04-27 19:17:04.122662	2020-04-27 19:17:04.122662
5502	50	1	21	2020-04-27 19:17:04.144325	2020-04-27 19:17:04.144325
5503	50	1	22	2020-04-27 19:17:04.160676	2020-04-27 19:17:04.160676
5504	50	1	23	2020-04-27 19:17:04.180166	2020-04-27 19:17:04.180166
5505	50	1	24	2020-04-27 19:17:04.193031	2020-04-27 19:17:04.193031
5506	50	1	25	2020-04-27 19:17:04.21133	2020-04-27 19:17:04.21133
5507	50	1	26	2020-04-27 19:17:04.244543	2020-04-27 19:17:04.244543
5508	50	1	27	2020-04-27 19:17:04.261728	2020-04-27 19:17:04.261728
5509	50	1	28	2020-04-27 19:17:04.277972	2020-04-27 19:17:04.277972
5510	50	1	29	2020-04-27 19:17:04.296457	2020-04-27 19:17:04.296457
5511	50	1	30	2020-04-27 19:17:04.312011	2020-04-27 19:17:04.312011
5512	50	1	31	2020-04-27 19:17:04.329592	2020-04-27 19:17:04.329592
5513	50	1	32	2020-04-27 19:17:04.344192	2020-04-27 19:17:04.344192
5514	50	1	33	2020-04-27 19:17:04.36239	2020-04-27 19:17:04.36239
5515	50	1	34	2020-04-27 19:17:04.374865	2020-04-27 19:17:04.374865
5516	50	1	35	2020-04-27 19:17:04.394774	2020-04-27 19:17:04.394774
5517	50	1	36	2020-04-27 19:17:04.413985	2020-04-27 19:17:04.413985
5518	50	1	37	2020-04-27 19:17:04.428289	2020-04-27 19:17:04.428289
5519	50	1	38	2020-04-27 19:17:04.444807	2020-04-27 19:17:04.444807
5520	50	1	39	2020-04-27 19:17:04.46018	2020-04-27 19:17:04.46018
5521	50	1	40	2020-04-27 19:17:04.475896	2020-04-27 19:17:04.475896
5522	50	1	41	2020-04-27 19:17:04.489703	2020-04-27 19:17:04.489703
5523	50	1	42	2020-04-27 19:17:04.505834	2020-04-27 19:17:04.505834
5524	50	1	43	2020-04-27 19:17:04.520448	2020-04-27 19:17:04.520448
5525	50	1	44	2020-04-27 19:17:04.539649	2020-04-27 19:17:04.539649
5526	50	1	45	2020-04-27 19:17:04.554735	2020-04-27 19:17:04.554735
5527	50	1	46	2020-04-27 19:17:04.569653	2020-04-27 19:17:04.569653
5528	50	1	47	2020-04-27 19:17:04.584399	2020-04-27 19:17:04.584399
5529	50	1	48	2020-04-27 19:17:04.598947	2020-04-27 19:17:04.598947
5530	50	1	49	2020-04-27 19:17:04.61691	2020-04-27 19:17:04.61691
5531	50	1	50	2020-04-27 19:17:04.629894	2020-04-27 19:17:04.629894
5532	50	1	51	2020-04-27 19:17:04.645545	2020-04-27 19:17:04.645545
5533	50	1	52	2020-04-27 19:17:04.661593	2020-04-27 19:17:04.661593
5534	50	1	53	2020-04-27 19:17:04.676622	2020-04-27 19:17:04.676622
5535	50	1	54	2020-04-27 19:17:04.690441	2020-04-27 19:17:04.690441
5536	50	1	55	2020-04-27 19:17:04.704772	2020-04-27 19:17:04.704772
5537	50	1	56	2020-04-27 19:17:04.722963	2020-04-27 19:17:04.722963
5538	50	1	57	2020-04-27 19:17:04.736004	2020-04-27 19:17:04.736004
5539	50	1	58	2020-04-27 19:17:04.752506	2020-04-27 19:17:04.752506
5540	50	1	59	2020-04-27 19:17:04.772616	2020-04-27 19:17:04.772616
5541	50	1	60	2020-04-27 19:17:04.815447	2020-04-27 19:17:04.815447
5542	50	1	61	2020-04-27 19:17:04.844995	2020-04-27 19:17:04.844995
5543	50	1	62	2020-04-27 19:17:04.8603	2020-04-27 19:17:04.8603
5544	50	1	63	2020-04-27 19:17:04.8766	2020-04-27 19:17:04.8766
5545	50	1	64	2020-04-27 19:17:04.892206	2020-04-27 19:17:04.892206
5546	50	1	65	2020-04-27 19:17:04.907174	2020-04-27 19:17:04.907174
5547	50	1	66	2020-04-27 19:17:04.920054	2020-04-27 19:17:04.920054
5548	50	1	67	2020-04-27 19:17:04.935152	2020-04-27 19:17:04.935152
5549	50	1	68	2020-04-27 19:17:04.945121	2020-04-27 19:17:04.945121
5550	50	1	69	2020-04-27 19:17:04.967533	2020-04-27 19:17:04.967533
5551	50	1	70	2020-04-27 19:17:04.978608	2020-04-27 19:17:04.978608
5552	50	1	71	2020-04-27 19:17:04.994288	2020-04-27 19:17:04.994288
5553	50	1	72	2020-04-27 19:17:05.007446	2020-04-27 19:17:05.007446
5554	50	1	73	2020-04-27 19:17:05.020809	2020-04-27 19:17:05.020809
5555	50	1	74	2020-04-27 19:17:05.034653	2020-04-27 19:17:05.034653
5556	50	1	1	2020-04-27 20:15:15.255668	2020-04-27 20:15:15.255668
5557	50	1	2	2020-04-27 20:15:15.26767	2020-04-27 20:15:15.26767
5558	50	1	3	2020-04-27 20:15:15.28019	2020-04-27 20:15:15.28019
5559	50	1	4	2020-04-27 20:15:15.300942	2020-04-27 20:15:15.300942
5560	50	1	5	2020-04-27 20:15:15.316064	2020-04-27 20:15:15.316064
5561	50	1	6	2020-04-27 20:15:15.329523	2020-04-27 20:15:15.329523
5562	50	1	7	2020-04-27 20:15:15.341832	2020-04-27 20:15:15.341832
5563	50	1	8	2020-04-27 20:15:15.360257	2020-04-27 20:15:15.360257
5564	50	1	9	2020-04-27 20:15:15.370869	2020-04-27 20:15:15.370869
5565	50	1	10	2020-04-27 20:15:15.383344	2020-04-27 20:15:15.383344
5566	50	1	11	2020-04-27 20:15:15.397212	2020-04-27 20:15:15.397212
5567	50	1	12	2020-04-27 20:15:15.408775	2020-04-27 20:15:15.408775
5568	50	1	13	2020-04-27 20:15:15.422633	2020-04-27 20:15:15.422633
5569	50	1	14	2020-04-27 20:15:15.43528	2020-04-27 20:15:15.43528
5570	50	1	15	2020-04-27 20:15:15.448973	2020-04-27 20:15:15.448973
5571	50	1	16	2020-04-27 20:15:15.461756	2020-04-27 20:15:15.461756
5572	50	1	17	2020-04-27 20:15:15.473576	2020-04-27 20:15:15.473576
5573	50	1	18	2020-04-27 20:15:15.489848	2020-04-27 20:15:15.489848
5574	50	1	19	2020-04-27 20:15:15.503631	2020-04-27 20:15:15.503631
5575	50	1	20	2020-04-27 20:15:15.523724	2020-04-27 20:15:15.523724
5576	50	1	21	2020-04-27 20:15:15.557434	2020-04-27 20:15:15.557434
5577	50	1	22	2020-04-27 20:15:15.571372	2020-04-27 20:15:15.571372
5578	50	1	23	2020-04-27 20:15:15.583142	2020-04-27 20:15:15.583142
5579	50	1	24	2020-04-27 20:15:15.596978	2020-04-27 20:15:15.596978
5580	50	1	25	2020-04-27 20:15:15.607769	2020-04-27 20:15:15.607769
5581	50	1	26	2020-04-27 20:15:15.623377	2020-04-27 20:15:15.623377
5582	50	1	27	2020-04-27 20:15:15.654307	2020-04-27 20:15:15.654307
5583	50	1	28	2020-04-27 20:15:15.669821	2020-04-27 20:15:15.669821
5584	50	1	29	2020-04-27 20:15:15.681429	2020-04-27 20:15:15.681429
5585	50	1	30	2020-04-27 20:15:15.699715	2020-04-27 20:15:15.699715
5586	50	1	31	2020-04-27 20:15:15.710077	2020-04-27 20:15:15.710077
5587	50	1	32	2020-04-27 20:15:15.722	2020-04-27 20:15:15.722
5588	50	1	33	2020-04-27 20:15:15.732712	2020-04-27 20:15:15.732712
5589	50	1	34	2020-04-27 20:15:15.744827	2020-04-27 20:15:15.744827
5590	50	1	35	2020-04-27 20:15:15.758192	2020-04-27 20:15:15.758192
5591	50	1	36	2020-04-27 20:15:15.770392	2020-04-27 20:15:15.770392
5592	50	1	37	2020-04-27 20:15:15.783754	2020-04-27 20:15:15.783754
5593	50	1	38	2020-04-27 20:15:15.796173	2020-04-27 20:15:15.796173
5594	50	1	39	2020-04-27 20:15:15.810073	2020-04-27 20:15:15.810073
5595	50	1	40	2020-04-27 20:15:15.823038	2020-04-27 20:15:15.823038
5596	50	1	41	2020-04-27 20:15:15.836321	2020-04-27 20:15:15.836321
5597	50	1	42	2020-04-27 20:15:15.852401	2020-04-27 20:15:15.852401
5598	50	1	43	2020-04-27 20:15:15.864019	2020-04-27 20:15:15.864019
5599	50	1	44	2020-04-27 20:15:15.873995	2020-04-27 20:15:15.873995
5600	50	1	45	2020-04-27 20:15:15.885865	2020-04-27 20:15:15.885865
5601	50	1	46	2020-04-27 20:15:15.897007	2020-04-27 20:15:15.897007
5602	50	1	47	2020-04-27 20:15:15.907448	2020-04-27 20:15:15.907448
5603	50	1	48	2020-04-27 20:15:15.921037	2020-04-27 20:15:15.921037
5604	50	1	49	2020-04-27 20:15:15.937805	2020-04-27 20:15:15.937805
5605	50	1	50	2020-04-27 20:15:15.948493	2020-04-27 20:15:15.948493
5606	50	1	51	2020-04-27 20:15:15.963836	2020-04-27 20:15:15.963836
5607	50	1	52	2020-04-27 20:15:15.974623	2020-04-27 20:15:15.974623
5608	50	1	53	2020-04-27 20:15:15.986131	2020-04-27 20:15:15.986131
5609	50	1	54	2020-04-27 20:15:15.998662	2020-04-27 20:15:15.998662
5610	50	1	55	2020-04-27 20:15:16.008197	2020-04-27 20:15:16.008197
5611	50	1	56	2020-04-27 20:15:16.020121	2020-04-27 20:15:16.020121
5612	50	1	57	2020-04-27 20:15:16.032678	2020-04-27 20:15:16.032678
5613	50	1	58	2020-04-27 20:15:16.045851	2020-04-27 20:15:16.045851
5614	50	1	59	2020-04-27 20:15:16.05947	2020-04-27 20:15:16.05947
5615	50	1	60	2020-04-27 20:15:16.070907	2020-04-27 20:15:16.070907
5616	50	1	61	2020-04-27 20:15:16.082301	2020-04-27 20:15:16.082301
5617	50	1	62	2020-04-27 20:15:16.093077	2020-04-27 20:15:16.093077
5618	50	1	63	2020-04-27 20:15:16.104823	2020-04-27 20:15:16.104823
5619	50	1	64	2020-04-27 20:15:16.118638	2020-04-27 20:15:16.118638
5620	50	1	65	2020-04-27 20:15:16.130873	2020-04-27 20:15:16.130873
5621	50	1	66	2020-04-27 20:15:16.147122	2020-04-27 20:15:16.147122
5622	50	1	67	2020-04-27 20:15:16.157012	2020-04-27 20:15:16.157012
5623	50	1	68	2020-04-27 20:15:16.168417	2020-04-27 20:15:16.168417
5624	50	1	69	2020-04-27 20:15:16.180603	2020-04-27 20:15:16.180603
5625	50	1	70	2020-04-27 20:15:16.192284	2020-04-27 20:15:16.192284
5626	50	1	71	2020-04-27 20:15:16.205638	2020-04-27 20:15:16.205638
5627	50	1	72	2020-04-27 20:15:16.216161	2020-04-27 20:15:16.216161
5628	50	1	73	2020-04-27 20:15:16.226988	2020-04-27 20:15:16.226988
5629	50	1	74	2020-04-27 20:15:16.238155	2020-04-27 20:15:16.238155
5630	50	1	1	2020-04-28 00:39:25.081987	2020-04-28 00:39:25.081987
5631	50	1	2	2020-04-28 00:39:25.098635	2020-04-28 00:39:25.098635
5632	50	1	3	2020-04-28 00:39:25.115195	2020-04-28 00:39:25.115195
5633	50	1	4	2020-04-28 00:39:25.132395	2020-04-28 00:39:25.132395
5634	50	1	5	2020-04-28 00:39:25.146846	2020-04-28 00:39:25.146846
5635	50	1	6	2020-04-28 00:39:25.166215	2020-04-28 00:39:25.166215
5636	50	1	7	2020-04-28 00:39:25.181563	2020-04-28 00:39:25.181563
5637	50	1	8	2020-04-28 00:39:25.192574	2020-04-28 00:39:25.192574
5638	50	1	9	2020-04-28 00:39:25.206383	2020-04-28 00:39:25.206383
5639	50	1	10	2020-04-28 00:39:25.21925	2020-04-28 00:39:25.21925
5640	50	1	11	2020-04-28 00:39:25.23088	2020-04-28 00:39:25.23088
5641	50	1	12	2020-04-28 00:39:25.24246	2020-04-28 00:39:25.24246
5642	50	1	13	2020-04-28 00:39:25.253183	2020-04-28 00:39:25.253183
5643	50	1	14	2020-04-28 00:39:25.265496	2020-04-28 00:39:25.265496
5644	50	1	15	2020-04-28 00:39:25.276839	2020-04-28 00:39:25.276839
5645	50	1	16	2020-04-28 00:39:25.286701	2020-04-28 00:39:25.286701
5646	50	1	17	2020-04-28 00:39:25.299236	2020-04-28 00:39:25.299236
5647	50	1	18	2020-04-28 00:39:25.310053	2020-04-28 00:39:25.310053
5648	50	1	19	2020-04-28 00:39:25.32009	2020-04-28 00:39:25.32009
5649	50	1	20	2020-04-28 00:39:25.333629	2020-04-28 00:39:25.333629
5650	50	1	21	2020-04-28 00:39:25.343402	2020-04-28 00:39:25.343402
5651	50	1	22	2020-04-28 00:39:25.352822	2020-04-28 00:39:25.352822
5652	50	1	23	2020-04-28 00:39:25.365154	2020-04-28 00:39:25.365154
5653	50	1	24	2020-04-28 00:39:25.376142	2020-04-28 00:39:25.376142
5654	50	1	25	2020-04-28 00:39:25.385883	2020-04-28 00:39:25.385883
5655	50	1	26	2020-04-28 00:39:25.398552	2020-04-28 00:39:25.398552
5656	50	1	27	2020-04-28 00:39:25.40927	2020-04-28 00:39:25.40927
5657	50	1	28	2020-04-28 00:39:25.4206	2020-04-28 00:39:25.4206
5658	50	1	29	2020-04-28 00:39:25.431829	2020-04-28 00:39:25.431829
5659	50	1	30	2020-04-28 00:39:25.442443	2020-04-28 00:39:25.442443
5660	50	1	31	2020-04-28 00:39:25.456099	2020-04-28 00:39:25.456099
5661	50	1	32	2020-04-28 00:39:25.46638	2020-04-28 00:39:25.46638
5662	50	1	33	2020-04-28 00:39:25.477212	2020-04-28 00:39:25.477212
5663	50	1	34	2020-04-28 00:39:25.488881	2020-04-28 00:39:25.488881
5664	50	1	35	2020-04-28 00:39:25.504138	2020-04-28 00:39:25.504138
5665	50	1	36	2020-04-28 00:39:25.515363	2020-04-28 00:39:25.515363
5666	50	1	37	2020-04-28 00:39:25.526487	2020-04-28 00:39:25.526487
5667	50	1	38	2020-04-28 00:39:25.535494	2020-04-28 00:39:25.535494
5668	50	1	39	2020-04-28 00:39:25.546091	2020-04-28 00:39:25.546091
5669	50	1	40	2020-04-28 00:39:25.557083	2020-04-28 00:39:25.557083
5670	50	1	41	2020-04-28 00:39:25.566665	2020-04-28 00:39:25.566665
5671	50	1	42	2020-04-28 00:39:25.577328	2020-04-28 00:39:25.577328
5672	50	1	43	2020-04-28 00:39:25.586809	2020-04-28 00:39:25.586809
5673	50	1	44	2020-04-28 00:39:25.599299	2020-04-28 00:39:25.599299
5674	50	1	45	2020-04-28 00:39:25.611858	2020-04-28 00:39:25.611858
5675	50	1	46	2020-04-28 00:39:25.62332	2020-04-28 00:39:25.62332
5676	50	1	47	2020-04-28 00:39:25.63552	2020-04-28 00:39:25.63552
5677	50	1	48	2020-04-28 00:39:25.646873	2020-04-28 00:39:25.646873
5678	50	1	49	2020-04-28 00:39:25.660038	2020-04-28 00:39:25.660038
5679	50	1	50	2020-04-28 00:39:25.670362	2020-04-28 00:39:25.670362
5680	50	1	51	2020-04-28 00:39:25.682503	2020-04-28 00:39:25.682503
5681	50	1	52	2020-04-28 00:39:25.696181	2020-04-28 00:39:25.696181
5682	50	1	53	2020-04-28 00:39:25.707414	2020-04-28 00:39:25.707414
5683	50	1	54	2020-04-28 00:39:25.71779	2020-04-28 00:39:25.71779
5684	50	1	55	2020-04-28 00:39:25.729241	2020-04-28 00:39:25.729241
5685	50	1	56	2020-04-28 00:39:25.740091	2020-04-28 00:39:25.740091
5686	50	1	57	2020-04-28 00:39:25.75047	2020-04-28 00:39:25.75047
5687	50	1	58	2020-04-28 00:39:25.760569	2020-04-28 00:39:25.760569
5688	50	1	59	2020-04-28 00:39:25.774593	2020-04-28 00:39:25.774593
5689	50	1	60	2020-04-28 00:39:25.784651	2020-04-28 00:39:25.784651
5690	50	1	61	2020-04-28 00:39:25.795971	2020-04-28 00:39:25.795971
5691	50	1	62	2020-04-28 00:39:25.807435	2020-04-28 00:39:25.807435
5692	50	1	63	2020-04-28 00:39:25.819673	2020-04-28 00:39:25.819673
5693	50	1	64	2020-04-28 00:39:25.831358	2020-04-28 00:39:25.831358
5694	50	1	65	2020-04-28 00:39:25.841531	2020-04-28 00:39:25.841531
5695	50	1	66	2020-04-28 00:39:25.852672	2020-04-28 00:39:25.852672
5696	50	1	67	2020-04-28 00:39:25.864503	2020-04-28 00:39:25.864503
5697	50	1	68	2020-04-28 00:39:25.875058	2020-04-28 00:39:25.875058
5698	50	1	69	2020-04-28 00:39:25.885247	2020-04-28 00:39:25.885247
5699	50	1	70	2020-04-28 00:39:25.899508	2020-04-28 00:39:25.899508
5700	50	1	71	2020-04-28 00:39:25.912595	2020-04-28 00:39:25.912595
5701	50	1	72	2020-04-28 00:39:25.923492	2020-04-28 00:39:25.923492
5702	50	1	73	2020-04-28 00:39:25.934052	2020-04-28 00:39:25.934052
5703	50	1	74	2020-04-28 00:39:25.944974	2020-04-28 00:39:25.944974
5704	50	1	1	2020-04-28 21:00:15.934447	2020-04-28 21:00:15.934447
5705	50	1	2	2020-04-28 21:00:15.947866	2020-04-28 21:00:15.947866
5706	50	1	3	2020-04-28 21:00:15.962169	2020-04-28 21:00:15.962169
5707	50	1	4	2020-04-28 21:00:15.973396	2020-04-28 21:00:15.973396
5708	50	1	5	2020-04-28 21:00:15.984639	2020-04-28 21:00:15.984639
5709	50	1	6	2020-04-28 21:00:15.996919	2020-04-28 21:00:15.996919
5710	50	1	7	2020-04-28 21:00:16.010408	2020-04-28 21:00:16.010408
5711	50	1	8	2020-04-28 21:00:16.021917	2020-04-28 21:00:16.021917
5712	50	1	9	2020-04-28 21:00:16.034947	2020-04-28 21:00:16.034947
5713	50	1	10	2020-04-28 21:00:16.04602	2020-04-28 21:00:16.04602
5714	50	1	11	2020-04-28 21:00:16.056884	2020-04-28 21:00:16.056884
5715	50	1	12	2020-04-28 21:00:16.067962	2020-04-28 21:00:16.067962
5716	50	1	13	2020-04-28 21:00:16.081787	2020-04-28 21:00:16.081787
5717	50	1	14	2020-04-28 21:00:16.100032	2020-04-28 21:00:16.100032
5718	50	1	15	2020-04-28 21:00:16.112334	2020-04-28 21:00:16.112334
5719	50	1	16	2020-04-28 21:00:16.128316	2020-04-28 21:00:16.128316
5720	50	1	17	2020-04-28 21:00:16.142576	2020-04-28 21:00:16.142576
5721	50	1	18	2020-04-28 21:00:16.161717	2020-04-28 21:00:16.161717
5722	50	1	19	2020-04-28 21:00:16.174298	2020-04-28 21:00:16.174298
5723	50	1	20	2020-04-28 21:00:16.193539	2020-04-28 21:00:16.193539
5724	50	1	21	2020-04-28 21:00:16.20334	2020-04-28 21:00:16.20334
5725	50	1	22	2020-04-28 21:00:16.216302	2020-04-28 21:00:16.216302
5726	50	1	23	2020-04-28 21:00:16.230834	2020-04-28 21:00:16.230834
5727	50	1	24	2020-04-28 21:00:16.246954	2020-04-28 21:00:16.246954
5728	50	1	25	2020-04-28 21:00:16.260306	2020-04-28 21:00:16.260306
5729	50	1	26	2020-04-28 21:00:16.276136	2020-04-28 21:00:16.276136
5730	50	1	27	2020-04-28 21:00:16.288605	2020-04-28 21:00:16.288605
5731	50	1	28	2020-04-28 21:00:16.300466	2020-04-28 21:00:16.300466
5732	50	1	29	2020-04-28 21:00:16.318842	2020-04-28 21:00:16.318842
5733	50	1	30	2020-04-28 21:00:16.331608	2020-04-28 21:00:16.331608
5734	50	1	31	2020-04-28 21:00:16.345934	2020-04-28 21:00:16.345934
5735	50	1	32	2020-04-28 21:00:16.358518	2020-04-28 21:00:16.358518
5736	50	1	33	2020-04-28 21:00:16.370719	2020-04-28 21:00:16.370719
5737	50	1	34	2020-04-28 21:00:16.381649	2020-04-28 21:00:16.381649
5738	50	1	35	2020-04-28 21:00:16.393266	2020-04-28 21:00:16.393266
5739	50	1	36	2020-04-28 21:00:16.403343	2020-04-28 21:00:16.403343
5740	50	1	37	2020-04-28 21:00:16.416328	2020-04-28 21:00:16.416328
5741	50	1	38	2020-04-28 21:00:16.430485	2020-04-28 21:00:16.430485
5742	50	1	39	2020-04-28 21:00:16.44046	2020-04-28 21:00:16.44046
5743	50	1	40	2020-04-28 21:00:16.451664	2020-04-28 21:00:16.451664
5744	50	1	41	2020-04-28 21:00:16.463964	2020-04-28 21:00:16.463964
5745	50	1	42	2020-04-28 21:00:16.475207	2020-04-28 21:00:16.475207
5746	50	1	43	2020-04-28 21:00:16.487001	2020-04-28 21:00:16.487001
5747	50	1	44	2020-04-28 21:00:16.498164	2020-04-28 21:00:16.498164
5748	50	1	45	2020-04-28 21:00:16.510751	2020-04-28 21:00:16.510751
5749	50	1	46	2020-04-28 21:00:16.528841	2020-04-28 21:00:16.528841
5750	50	1	47	2020-04-28 21:00:16.538903	2020-04-28 21:00:16.538903
5751	50	1	48	2020-04-28 21:00:16.551812	2020-04-28 21:00:16.551812
5752	50	1	49	2020-04-28 21:00:16.56381	2020-04-28 21:00:16.56381
5753	50	1	50	2020-04-28 21:00:16.574592	2020-04-28 21:00:16.574592
5754	50	1	51	2020-04-28 21:00:16.586717	2020-04-28 21:00:16.586717
5755	50	1	52	2020-04-28 21:00:16.601797	2020-04-28 21:00:16.601797
5756	50	1	53	2020-04-28 21:00:16.614885	2020-04-28 21:00:16.614885
5757	50	1	54	2020-04-28 21:00:16.628292	2020-04-28 21:00:16.628292
5758	50	1	55	2020-04-28 21:00:16.643421	2020-04-28 21:00:16.643421
5759	50	1	56	2020-04-28 21:00:16.655184	2020-04-28 21:00:16.655184
5760	50	1	57	2020-04-28 21:00:16.670283	2020-04-28 21:00:16.670283
5761	50	1	58	2020-04-28 21:00:16.682507	2020-04-28 21:00:16.682507
5762	50	1	59	2020-04-28 21:00:16.693933	2020-04-28 21:00:16.693933
5763	50	1	60	2020-04-28 21:00:16.707096	2020-04-28 21:00:16.707096
5764	50	1	61	2020-04-28 21:00:16.721227	2020-04-28 21:00:16.721227
5765	50	1	62	2020-04-28 21:00:16.736709	2020-04-28 21:00:16.736709
5766	50	1	63	2020-04-28 21:00:16.750389	2020-04-28 21:00:16.750389
5767	50	1	64	2020-04-28 21:00:16.766025	2020-04-28 21:00:16.766025
5768	50	1	65	2020-04-28 21:00:16.779026	2020-04-28 21:00:16.779026
5769	50	1	66	2020-04-28 21:00:16.78923	2020-04-28 21:00:16.78923
5770	50	1	67	2020-04-28 21:00:16.80504	2020-04-28 21:00:16.80504
5771	50	1	68	2020-04-28 21:00:16.818961	2020-04-28 21:00:16.818961
5772	50	1	69	2020-04-28 21:00:16.832369	2020-04-28 21:00:16.832369
5773	50	1	70	2020-04-28 21:00:16.843165	2020-04-28 21:00:16.843165
5774	50	1	71	2020-04-28 21:00:16.856824	2020-04-28 21:00:16.856824
5775	50	1	72	2020-04-28 21:00:16.868736	2020-04-28 21:00:16.868736
5776	50	1	73	2020-04-28 21:00:16.883176	2020-04-28 21:00:16.883176
5777	50	1	74	2020-04-28 21:00:16.894665	2020-04-28 21:00:16.894665
5778	50	1	1	2020-05-04 14:59:51.362725	2020-05-04 14:59:51.362725
5779	50	1	2	2020-05-04 14:59:51.441042	2020-05-04 14:59:51.441042
5780	50	1	3	2020-05-04 14:59:51.46563	2020-05-04 14:59:51.46563
5781	50	1	4	2020-05-04 14:59:51.50123	2020-05-04 14:59:51.50123
5782	50	1	5	2020-05-04 14:59:51.524262	2020-05-04 14:59:51.524262
5783	50	1	6	2020-05-04 14:59:51.546184	2020-05-04 14:59:51.546184
5784	50	1	7	2020-05-04 14:59:51.56632	2020-05-04 14:59:51.56632
5785	50	1	8	2020-05-04 14:59:51.597588	2020-05-04 14:59:51.597588
5786	50	1	9	2020-05-04 14:59:51.63144	2020-05-04 14:59:51.63144
5787	50	1	10	2020-05-04 14:59:51.660088	2020-05-04 14:59:51.660088
5788	50	1	11	2020-05-04 14:59:51.676352	2020-05-04 14:59:51.676352
5789	50	1	12	2020-05-04 14:59:51.688831	2020-05-04 14:59:51.688831
5790	50	1	13	2020-05-04 14:59:51.701908	2020-05-04 14:59:51.701908
5791	50	1	14	2020-05-04 14:59:51.718276	2020-05-04 14:59:51.718276
5792	50	1	15	2020-05-04 14:59:51.735348	2020-05-04 14:59:51.735348
5793	50	1	16	2020-05-04 14:59:51.752426	2020-05-04 14:59:51.752426
5794	50	1	17	2020-05-04 14:59:51.768693	2020-05-04 14:59:51.768693
5795	50	1	18	2020-05-04 14:59:51.787754	2020-05-04 14:59:51.787754
5796	50	1	19	2020-05-04 14:59:51.801497	2020-05-04 14:59:51.801497
5797	50	1	20	2020-05-04 14:59:51.814204	2020-05-04 14:59:51.814204
5798	50	1	21	2020-05-04 14:59:51.82952	2020-05-04 14:59:51.82952
5799	50	1	22	2020-05-04 14:59:51.844	2020-05-04 14:59:51.844
5800	50	1	23	2020-05-04 14:59:51.859467	2020-05-04 14:59:51.859467
5801	50	1	24	2020-05-04 14:59:51.876207	2020-05-04 14:59:51.876207
5802	50	1	25	2020-05-04 14:59:51.891121	2020-05-04 14:59:51.891121
5803	50	1	26	2020-05-04 14:59:51.91121	2020-05-04 14:59:51.91121
5804	50	1	27	2020-05-04 14:59:51.92666	2020-05-04 14:59:51.92666
5805	50	1	28	2020-05-04 14:59:51.937827	2020-05-04 14:59:51.937827
5806	50	1	29	2020-05-04 14:59:51.953942	2020-05-04 14:59:51.953942
5807	50	1	30	2020-05-04 14:59:51.969009	2020-05-04 14:59:51.969009
5808	50	1	31	2020-05-04 14:59:51.982364	2020-05-04 14:59:51.982364
5809	50	1	32	2020-05-04 14:59:51.99919	2020-05-04 14:59:51.99919
5810	50	1	33	2020-05-04 14:59:52.012799	2020-05-04 14:59:52.012799
5811	50	1	34	2020-05-04 14:59:52.029214	2020-05-04 14:59:52.029214
5812	50	1	35	2020-05-04 14:59:52.044502	2020-05-04 14:59:52.044502
5813	50	1	36	2020-05-04 14:59:52.060768	2020-05-04 14:59:52.060768
5814	50	1	37	2020-05-04 14:59:52.076965	2020-05-04 14:59:52.076965
5815	50	1	38	2020-05-04 14:59:52.088731	2020-05-04 14:59:52.088731
5816	50	1	39	2020-05-04 14:59:52.103832	2020-05-04 14:59:52.103832
5817	50	1	40	2020-05-04 14:59:52.122389	2020-05-04 14:59:52.122389
5818	50	1	41	2020-05-04 14:59:52.143948	2020-05-04 14:59:52.143948
5819	50	1	42	2020-05-04 14:59:52.161426	2020-05-04 14:59:52.161426
5820	50	1	43	2020-05-04 14:59:52.17389	2020-05-04 14:59:52.17389
5821	50	1	44	2020-05-04 14:59:52.189571	2020-05-04 14:59:52.189571
5822	50	1	45	2020-05-04 14:59:52.203211	2020-05-04 14:59:52.203211
5823	50	1	46	2020-05-04 14:59:52.223195	2020-05-04 14:59:52.223195
5824	50	1	47	2020-05-04 14:59:52.237707	2020-05-04 14:59:52.237707
5825	50	1	48	2020-05-04 14:59:52.255829	2020-05-04 14:59:52.255829
5826	50	1	49	2020-05-04 14:59:52.273236	2020-05-04 14:59:52.273236
5827	50	1	50	2020-05-04 14:59:52.288172	2020-05-04 14:59:52.288172
5828	50	1	51	2020-05-04 14:59:52.303014	2020-05-04 14:59:52.303014
5829	50	1	52	2020-05-04 14:59:52.319966	2020-05-04 14:59:52.319966
5830	50	1	53	2020-05-04 14:59:52.332232	2020-05-04 14:59:52.332232
5831	50	1	54	2020-05-04 14:59:52.352951	2020-05-04 14:59:52.352951
5832	50	1	55	2020-05-04 14:59:52.370822	2020-05-04 14:59:52.370822
5833	50	1	56	2020-05-04 14:59:52.386701	2020-05-04 14:59:52.386701
5834	50	1	57	2020-05-04 14:59:52.403765	2020-05-04 14:59:52.403765
5835	50	1	58	2020-05-04 14:59:52.420907	2020-05-04 14:59:52.420907
5836	50	1	59	2020-05-04 14:59:52.437721	2020-05-04 14:59:52.437721
5837	50	1	60	2020-05-04 14:59:52.453363	2020-05-04 14:59:52.453363
5838	50	1	61	2020-05-04 14:59:52.476529	2020-05-04 14:59:52.476529
5839	50	1	62	2020-05-04 14:59:52.497731	2020-05-04 14:59:52.497731
5840	50	1	63	2020-05-04 14:59:52.514329	2020-05-04 14:59:52.514329
5841	50	1	64	2020-05-04 14:59:52.532501	2020-05-04 14:59:52.532501
5842	50	1	65	2020-05-04 14:59:52.570225	2020-05-04 14:59:52.570225
5843	50	1	66	2020-05-04 14:59:52.608751	2020-05-04 14:59:52.608751
5844	50	1	67	2020-05-04 14:59:52.649084	2020-05-04 14:59:52.649084
5845	50	1	68	2020-05-04 14:59:52.686031	2020-05-04 14:59:52.686031
5846	50	1	69	2020-05-04 14:59:52.714307	2020-05-04 14:59:52.714307
5847	50	1	70	2020-05-04 14:59:52.73758	2020-05-04 14:59:52.73758
5848	50	1	71	2020-05-04 14:59:52.752913	2020-05-04 14:59:52.752913
5849	50	1	72	2020-05-04 14:59:52.787965	2020-05-04 14:59:52.787965
5850	50	1	73	2020-05-04 14:59:52.814961	2020-05-04 14:59:52.814961
5851	50	1	74	2020-05-04 14:59:52.833826	2020-05-04 14:59:52.833826
5852	50	1	1	2020-05-05 17:03:29.772512	2020-05-05 17:03:29.772512
5853	50	1	2	2020-05-05 17:03:29.862134	2020-05-05 17:03:29.862134
5854	50	1	3	2020-05-05 17:03:29.88783	2020-05-05 17:03:29.88783
5855	50	1	4	2020-05-05 17:03:29.903508	2020-05-05 17:03:29.903508
5856	50	1	5	2020-05-05 17:03:29.920079	2020-05-05 17:03:29.920079
5857	50	1	6	2020-05-05 17:03:29.940271	2020-05-05 17:03:29.940271
5858	50	1	7	2020-05-05 17:03:29.957526	2020-05-05 17:03:29.957526
5859	50	1	8	2020-05-05 17:03:29.976767	2020-05-05 17:03:29.976767
5860	50	1	9	2020-05-05 17:03:29.992295	2020-05-05 17:03:29.992295
5861	50	1	10	2020-05-05 17:03:30.010128	2020-05-05 17:03:30.010128
5862	50	1	11	2020-05-05 17:03:30.029602	2020-05-05 17:03:30.029602
5863	50	1	12	2020-05-05 17:03:30.042308	2020-05-05 17:03:30.042308
5864	50	1	13	2020-05-05 17:03:30.064274	2020-05-05 17:03:30.064274
5865	50	1	14	2020-05-05 17:03:30.084236	2020-05-05 17:03:30.084236
5866	50	1	15	2020-05-05 17:03:30.112362	2020-05-05 17:03:30.112362
5867	50	1	16	2020-05-05 17:03:30.135522	2020-05-05 17:03:30.135522
5868	50	1	17	2020-05-05 17:03:30.161234	2020-05-05 17:03:30.161234
5869	50	1	18	2020-05-05 17:03:30.204075	2020-05-05 17:03:30.204075
5870	50	1	19	2020-05-05 17:03:30.225658	2020-05-05 17:03:30.225658
5871	50	1	20	2020-05-05 17:03:30.241567	2020-05-05 17:03:30.241567
5872	50	1	21	2020-05-05 17:03:30.295796	2020-05-05 17:03:30.295796
5873	50	1	22	2020-05-05 17:03:30.353018	2020-05-05 17:03:30.353018
5874	50	1	23	2020-05-05 17:03:30.394966	2020-05-05 17:03:30.394966
5875	50	1	24	2020-05-05 17:03:30.432281	2020-05-05 17:03:30.432281
5876	50	1	25	2020-05-05 17:03:30.462119	2020-05-05 17:03:30.462119
5877	50	1	26	2020-05-05 17:03:30.492271	2020-05-05 17:03:30.492271
5878	50	1	27	2020-05-05 17:03:30.577794	2020-05-05 17:03:30.577794
5879	50	1	28	2020-05-05 17:03:30.609906	2020-05-05 17:03:30.609906
5880	50	1	29	2020-05-05 17:03:30.652995	2020-05-05 17:03:30.652995
5881	50	1	30	2020-05-05 17:03:30.693109	2020-05-05 17:03:30.693109
5882	50	1	31	2020-05-05 17:03:30.720307	2020-05-05 17:03:30.720307
5883	50	1	32	2020-05-05 17:03:30.778075	2020-05-05 17:03:30.778075
5884	50	1	33	2020-05-05 17:03:30.80882	2020-05-05 17:03:30.80882
5885	50	1	34	2020-05-05 17:03:30.840306	2020-05-05 17:03:30.840306
5886	50	1	35	2020-05-05 17:03:30.869469	2020-05-05 17:03:30.869469
5887	50	1	36	2020-05-05 17:03:30.926457	2020-05-05 17:03:30.926457
5888	50	1	37	2020-05-05 17:03:30.960727	2020-05-05 17:03:30.960727
5889	50	1	38	2020-05-05 17:03:30.992479	2020-05-05 17:03:30.992479
5890	50	1	39	2020-05-05 17:03:31.019034	2020-05-05 17:03:31.019034
5891	50	1	40	2020-05-05 17:03:31.041871	2020-05-05 17:03:31.041871
5892	50	1	41	2020-05-05 17:03:31.069355	2020-05-05 17:03:31.069355
5893	50	1	42	2020-05-05 17:03:31.094293	2020-05-05 17:03:31.094293
5894	50	1	43	2020-05-05 17:03:31.113379	2020-05-05 17:03:31.113379
5895	50	1	44	2020-05-05 17:03:31.155488	2020-05-05 17:03:31.155488
5896	50	1	45	2020-05-05 17:03:31.202879	2020-05-05 17:03:31.202879
5897	50	1	46	2020-05-05 17:03:31.235441	2020-05-05 17:03:31.235441
5898	50	1	47	2020-05-05 17:03:31.276087	2020-05-05 17:03:31.276087
5899	50	1	48	2020-05-05 17:03:31.303517	2020-05-05 17:03:31.303517
5900	50	1	49	2020-05-05 17:03:31.326817	2020-05-05 17:03:31.326817
5901	50	1	50	2020-05-05 17:03:31.355801	2020-05-05 17:03:31.355801
5902	50	1	51	2020-05-05 17:03:31.376694	2020-05-05 17:03:31.376694
5903	50	1	52	2020-05-05 17:03:31.40342	2020-05-05 17:03:31.40342
5904	50	1	53	2020-05-05 17:03:31.427928	2020-05-05 17:03:31.427928
5905	50	1	54	2020-05-05 17:03:31.456829	2020-05-05 17:03:31.456829
5906	50	1	55	2020-05-05 17:03:31.480671	2020-05-05 17:03:31.480671
5907	50	1	56	2020-05-05 17:03:31.519588	2020-05-05 17:03:31.519588
5908	50	1	57	2020-05-05 17:03:31.546037	2020-05-05 17:03:31.546037
5909	50	1	58	2020-05-05 17:03:31.574294	2020-05-05 17:03:31.574294
5910	50	1	59	2020-05-05 17:03:31.597594	2020-05-05 17:03:31.597594
5911	50	1	60	2020-05-05 17:03:31.627887	2020-05-05 17:03:31.627887
5912	50	1	61	2020-05-05 17:03:31.672536	2020-05-05 17:03:31.672536
5913	50	1	62	2020-05-05 17:03:31.692433	2020-05-05 17:03:31.692433
5914	50	1	63	2020-05-05 17:03:31.714495	2020-05-05 17:03:31.714495
5915	50	1	64	2020-05-05 17:03:31.74393	2020-05-05 17:03:31.74393
5916	50	1	65	2020-05-05 17:03:31.75995	2020-05-05 17:03:31.75995
5917	50	1	66	2020-05-05 17:03:31.780355	2020-05-05 17:03:31.780355
5918	50	1	67	2020-05-05 17:03:31.799245	2020-05-05 17:03:31.799245
5919	50	1	68	2020-05-05 17:03:31.825363	2020-05-05 17:03:31.825363
5920	50	1	69	2020-05-05 17:03:31.856242	2020-05-05 17:03:31.856242
5921	50	1	70	2020-05-05 17:03:31.873645	2020-05-05 17:03:31.873645
5922	50	1	71	2020-05-05 17:03:31.894572	2020-05-05 17:03:31.894572
5923	50	1	72	2020-05-05 17:03:31.915968	2020-05-05 17:03:31.915968
5924	50	1	73	2020-05-05 17:03:31.937005	2020-05-05 17:03:31.937005
5925	50	1	74	2020-05-05 17:03:31.961915	2020-05-05 17:03:31.961915
5926	74	1	1	2020-05-05 17:14:05.735371	2020-05-05 17:14:05.735371
5927	50	1	2	2020-05-05 17:14:05.774104	2020-05-05 17:14:05.774104
5928	50	1	3	2020-05-05 17:14:05.837152	2020-05-05 17:14:05.837152
5929	50	1	4	2020-05-05 17:14:05.974025	2020-05-05 17:14:05.974025
5930	50	1	5	2020-05-05 17:14:06.193783	2020-05-05 17:14:06.193783
5931	50	1	6	2020-05-05 17:14:06.256411	2020-05-05 17:14:06.256411
5932	50	1	7	2020-05-05 17:14:06.319452	2020-05-05 17:14:06.319452
5933	50	1	8	2020-05-05 17:14:06.3468	2020-05-05 17:14:06.3468
5934	50	1	9	2020-05-05 17:14:06.383893	2020-05-05 17:14:06.383893
5935	50	1	10	2020-05-05 17:14:06.454214	2020-05-05 17:14:06.454214
5936	50	1	11	2020-05-05 17:14:06.508019	2020-05-05 17:14:06.508019
5937	50	1	12	2020-05-05 17:14:06.550754	2020-05-05 17:14:06.550754
5938	50	1	13	2020-05-05 17:14:06.599799	2020-05-05 17:14:06.599799
5939	50	1	14	2020-05-05 17:14:06.640562	2020-05-05 17:14:06.640562
5940	50	1	15	2020-05-05 17:14:06.673746	2020-05-05 17:14:06.673746
5941	50	1	16	2020-05-05 17:14:06.697927	2020-05-05 17:14:06.697927
5942	50	1	17	2020-05-05 17:14:06.738246	2020-05-05 17:14:06.738246
5943	50	1	18	2020-05-05 17:14:06.774199	2020-05-05 17:14:06.774199
5944	50	1	19	2020-05-05 17:14:06.818752	2020-05-05 17:14:06.818752
5945	50	1	20	2020-05-05 17:14:06.866643	2020-05-05 17:14:06.866643
5946	50	1	21	2020-05-05 17:14:06.913958	2020-05-05 17:14:06.913958
5947	50	1	22	2020-05-05 17:14:06.94386	2020-05-05 17:14:06.94386
5948	50	1	23	2020-05-05 17:14:07.00286	2020-05-05 17:14:07.00286
5949	50	1	24	2020-05-05 17:14:07.031884	2020-05-05 17:14:07.031884
5950	50	1	25	2020-05-05 17:14:07.074258	2020-05-05 17:14:07.074258
5951	50	1	26	2020-05-05 17:14:07.119005	2020-05-05 17:14:07.119005
5952	50	1	27	2020-05-05 17:14:07.159161	2020-05-05 17:14:07.159161
5953	50	1	28	2020-05-05 17:14:07.202235	2020-05-05 17:14:07.202235
5954	50	1	29	2020-05-05 17:14:07.237162	2020-05-05 17:14:07.237162
5955	50	1	30	2020-05-05 17:14:07.277448	2020-05-05 17:14:07.277448
5956	50	1	31	2020-05-05 17:14:07.307888	2020-05-05 17:14:07.307888
5957	50	1	32	2020-05-05 17:14:07.33595	2020-05-05 17:14:07.33595
5958	50	1	33	2020-05-05 17:14:07.375111	2020-05-05 17:14:07.375111
5959	50	1	34	2020-05-05 17:14:07.415639	2020-05-05 17:14:07.415639
5960	50	1	35	2020-05-05 17:14:07.490267	2020-05-05 17:14:07.490267
5961	50	1	36	2020-05-05 17:14:07.522748	2020-05-05 17:14:07.522748
5962	50	1	37	2020-05-05 17:14:07.572488	2020-05-05 17:14:07.572488
5963	50	1	38	2020-05-05 17:14:07.616835	2020-05-05 17:14:07.616835
5964	50	1	39	2020-05-05 17:14:07.673997	2020-05-05 17:14:07.673997
5965	50	1	40	2020-05-05 17:14:07.710744	2020-05-05 17:14:07.710744
5966	50	1	41	2020-05-05 17:14:07.780581	2020-05-05 17:14:07.780581
5967	50	1	42	2020-05-05 17:14:07.852283	2020-05-05 17:14:07.852283
5968	50	1	43	2020-05-05 17:14:07.896982	2020-05-05 17:14:07.896982
5969	50	1	44	2020-05-05 17:14:07.940976	2020-05-05 17:14:07.940976
5970	50	1	45	2020-05-05 17:14:07.973548	2020-05-05 17:14:07.973548
5971	50	1	46	2020-05-05 17:14:08.008343	2020-05-05 17:14:08.008343
5972	50	1	47	2020-05-05 17:14:08.052788	2020-05-05 17:14:08.052788
5973	50	1	48	2020-05-05 17:14:08.103161	2020-05-05 17:14:08.103161
5974	50	1	49	2020-05-05 17:14:08.147597	2020-05-05 17:14:08.147597
5975	50	1	50	2020-05-05 17:14:08.218121	2020-05-05 17:14:08.218121
5976	50	1	51	2020-05-05 17:14:08.262492	2020-05-05 17:14:08.262492
5977	50	1	52	2020-05-05 17:14:08.286715	2020-05-05 17:14:08.286715
5978	50	1	53	2020-05-05 17:14:08.335723	2020-05-05 17:14:08.335723
5979	50	1	54	2020-05-05 17:14:08.378405	2020-05-05 17:14:08.378405
5980	50	1	55	2020-05-05 17:14:08.511206	2020-05-05 17:14:08.511206
5981	50	1	56	2020-05-05 17:14:08.611988	2020-05-05 17:14:08.611988
5982	50	1	57	2020-05-05 17:14:08.693174	2020-05-05 17:14:08.693174
5983	50	1	58	2020-05-05 17:14:08.741603	2020-05-05 17:14:08.741603
5984	50	1	59	2020-05-05 17:14:08.825404	2020-05-05 17:14:08.825404
5985	50	1	60	2020-05-05 17:14:08.856618	2020-05-05 17:14:08.856618
5986	50	1	61	2020-05-05 17:14:08.933297	2020-05-05 17:14:08.933297
5987	50	1	62	2020-05-05 17:14:09.004829	2020-05-05 17:14:09.004829
5988	50	1	63	2020-05-05 17:14:09.082069	2020-05-05 17:14:09.082069
5989	50	1	64	2020-05-05 17:14:09.172431	2020-05-05 17:14:09.172431
5990	50	1	65	2020-05-05 17:14:09.29006	2020-05-05 17:14:09.29006
5991	50	1	66	2020-05-05 17:14:09.417777	2020-05-05 17:14:09.417777
5992	50	1	67	2020-05-05 17:14:09.517936	2020-05-05 17:14:09.517936
5993	50	1	68	2020-05-05 17:14:09.619004	2020-05-05 17:14:09.619004
5994	50	1	69	2020-05-05 17:14:09.679395	2020-05-05 17:14:09.679395
5995	50	1	70	2020-05-05 17:14:09.698093	2020-05-05 17:14:09.698093
5996	50	1	71	2020-05-05 17:14:09.731937	2020-05-05 17:14:09.731937
5997	50	1	72	2020-05-05 17:14:09.762395	2020-05-05 17:14:09.762395
5998	50	1	73	2020-05-05 17:14:09.816205	2020-05-05 17:14:09.816205
5999	50	1	74	2020-05-05 17:14:09.887558	2020-05-05 17:14:09.887558
6000	50	1	1	2020-05-06 19:50:36.089321	2020-05-06 19:50:36.089321
6001	50	1	2	2020-05-06 19:50:36.19005	2020-05-06 19:50:36.19005
6002	50	1	3	2020-05-06 19:50:36.204125	2020-05-06 19:50:36.204125
6003	50	1	4	2020-05-06 19:50:36.258282	2020-05-06 19:50:36.258282
6004	50	1	5	2020-05-06 19:50:36.27295	2020-05-06 19:50:36.27295
6005	50	1	6	2020-05-06 19:50:36.285169	2020-05-06 19:50:36.285169
6006	50	1	7	2020-05-06 19:50:36.296935	2020-05-06 19:50:36.296935
6007	50	1	8	2020-05-06 19:50:36.308688	2020-05-06 19:50:36.308688
6008	50	1	9	2020-05-06 19:50:36.321691	2020-05-06 19:50:36.321691
6009	50	1	10	2020-05-06 19:50:36.33192	2020-05-06 19:50:36.33192
6010	50	1	11	2020-05-06 19:50:36.341838	2020-05-06 19:50:36.341838
6011	50	1	12	2020-05-06 19:50:36.352525	2020-05-06 19:50:36.352525
6012	50	1	13	2020-05-06 19:50:36.371318	2020-05-06 19:50:36.371318
6013	50	1	14	2020-05-06 19:50:36.381715	2020-05-06 19:50:36.381715
6014	50	1	15	2020-05-06 19:50:36.392202	2020-05-06 19:50:36.392202
6015	50	1	16	2020-05-06 19:50:36.405458	2020-05-06 19:50:36.405458
6016	50	1	17	2020-05-06 19:50:36.415655	2020-05-06 19:50:36.415655
6017	50	1	18	2020-05-06 19:50:36.426989	2020-05-06 19:50:36.426989
6018	50	1	19	2020-05-06 19:50:36.483446	2020-05-06 19:50:36.483446
6019	50	1	20	2020-05-06 19:50:36.496028	2020-05-06 19:50:36.496028
6020	50	1	21	2020-05-06 19:50:36.508905	2020-05-06 19:50:36.508905
6021	50	1	22	2020-05-06 19:50:36.52351	2020-05-06 19:50:36.52351
6022	50	1	23	2020-05-06 19:50:36.539171	2020-05-06 19:50:36.539171
6023	50	1	24	2020-05-06 19:50:36.554543	2020-05-06 19:50:36.554543
6024	50	1	25	2020-05-06 19:50:36.568773	2020-05-06 19:50:36.568773
6025	50	1	26	2020-05-06 19:50:36.584463	2020-05-06 19:50:36.584463
6026	50	1	27	2020-05-06 19:50:36.603957	2020-05-06 19:50:36.603957
6027	50	1	28	2020-05-06 19:50:36.619492	2020-05-06 19:50:36.619492
6028	50	1	29	2020-05-06 19:50:36.635398	2020-05-06 19:50:36.635398
6029	50	1	30	2020-05-06 19:50:36.65264	2020-05-06 19:50:36.65264
6030	50	1	31	2020-05-06 19:50:36.666603	2020-05-06 19:50:36.666603
6031	50	1	32	2020-05-06 19:50:36.676191	2020-05-06 19:50:36.676191
6032	50	1	33	2020-05-06 19:50:36.689786	2020-05-06 19:50:36.689786
6033	50	1	34	2020-05-06 19:50:36.704526	2020-05-06 19:50:36.704526
6034	50	1	35	2020-05-06 19:50:36.717621	2020-05-06 19:50:36.717621
6035	50	1	36	2020-05-06 19:50:36.727285	2020-05-06 19:50:36.727285
6036	50	1	37	2020-05-06 19:50:36.739967	2020-05-06 19:50:36.739967
6037	50	1	38	2020-05-06 19:50:36.749744	2020-05-06 19:50:36.749744
6038	50	1	39	2020-05-06 19:50:36.764234	2020-05-06 19:50:36.764234
6039	50	1	40	2020-05-06 19:50:36.779976	2020-05-06 19:50:36.779976
6040	50	1	41	2020-05-06 19:50:36.791207	2020-05-06 19:50:36.791207
6041	50	1	42	2020-05-06 19:50:36.804104	2020-05-06 19:50:36.804104
6042	50	1	43	2020-05-06 19:50:36.817815	2020-05-06 19:50:36.817815
6043	50	1	44	2020-05-06 19:50:36.831636	2020-05-06 19:50:36.831636
6044	50	1	45	2020-05-06 19:50:36.860234	2020-05-06 19:50:36.860234
6045	50	1	46	2020-05-06 19:50:36.875046	2020-05-06 19:50:36.875046
6046	50	1	47	2020-05-06 19:50:36.889317	2020-05-06 19:50:36.889317
6047	50	1	48	2020-05-06 19:50:36.901917	2020-05-06 19:50:36.901917
6048	50	1	49	2020-05-06 19:50:36.91668	2020-05-06 19:50:36.91668
6049	50	1	50	2020-05-06 19:50:36.927789	2020-05-06 19:50:36.927789
6050	50	1	51	2020-05-06 19:50:36.941369	2020-05-06 19:50:36.941369
6051	50	1	52	2020-05-06 19:50:36.954579	2020-05-06 19:50:36.954579
6052	50	1	53	2020-05-06 19:50:36.968783	2020-05-06 19:50:36.968783
6053	50	1	54	2020-05-06 19:50:36.987599	2020-05-06 19:50:36.987599
6054	50	1	55	2020-05-06 19:50:37.005249	2020-05-06 19:50:37.005249
6055	50	1	56	2020-05-06 19:50:37.016628	2020-05-06 19:50:37.016628
6056	50	1	57	2020-05-06 19:50:37.031146	2020-05-06 19:50:37.031146
6057	50	1	58	2020-05-06 19:50:37.041516	2020-05-06 19:50:37.041516
6058	50	1	59	2020-05-06 19:50:37.054039	2020-05-06 19:50:37.054039
6059	50	1	60	2020-05-06 19:50:37.068693	2020-05-06 19:50:37.068693
6060	50	1	61	2020-05-06 19:50:37.08054	2020-05-06 19:50:37.08054
6061	50	1	62	2020-05-06 19:50:37.094096	2020-05-06 19:50:37.094096
6062	50	1	63	2020-05-06 19:50:37.105859	2020-05-06 19:50:37.105859
6063	50	1	64	2020-05-06 19:50:37.11748	2020-05-06 19:50:37.11748
6064	50	1	65	2020-05-06 19:50:37.130654	2020-05-06 19:50:37.130654
6065	50	1	66	2020-05-06 19:50:37.14082	2020-05-06 19:50:37.14082
6066	50	1	67	2020-05-06 19:50:37.153312	2020-05-06 19:50:37.153312
6067	50	1	68	2020-05-06 19:50:37.167911	2020-05-06 19:50:37.167911
6068	50	1	69	2020-05-06 19:50:37.182861	2020-05-06 19:50:37.182861
6069	50	1	70	2020-05-06 19:50:37.193358	2020-05-06 19:50:37.193358
6070	50	1	71	2020-05-06 19:50:37.207413	2020-05-06 19:50:37.207413
6071	50	1	72	2020-05-06 19:50:37.219502	2020-05-06 19:50:37.219502
6072	50	1	73	2020-05-06 19:50:37.232956	2020-05-06 19:50:37.232956
6073	50	1	74	2020-05-06 19:50:37.247088	2020-05-06 19:50:37.247088
6074	50	1	1	2020-05-17 13:16:22.026947	2020-05-17 13:16:22.026947
6075	57	1	2	2020-05-17 13:16:22.328353	2020-05-17 13:16:22.328353
6076	67	1	3	2020-05-17 13:16:22.452945	2020-05-17 13:16:22.452945
6077	50	1	4	2020-05-17 13:16:22.46691	2020-05-17 13:16:22.46691
6078	50	1	5	2020-05-17 13:16:22.486344	2020-05-17 13:16:22.486344
6079	50	1	6	2020-05-17 13:16:22.498119	2020-05-17 13:16:22.498119
6080	50	1	7	2020-05-17 13:16:22.508236	2020-05-17 13:16:22.508236
6081	50	1	8	2020-05-17 13:16:22.573688	2020-05-17 13:16:22.573688
6082	50	1	9	2020-05-17 13:16:22.847071	2020-05-17 13:16:22.847071
6083	50	1	10	2020-05-17 13:16:22.878287	2020-05-17 13:16:22.878287
6084	50	1	11	2020-05-17 13:16:22.902373	2020-05-17 13:16:22.902373
6085	50	1	12	2020-05-17 13:16:22.922957	2020-05-17 13:16:22.922957
6086	50	1	13	2020-05-17 13:16:22.944441	2020-05-17 13:16:22.944441
6087	50	1	14	2020-05-17 13:16:22.957382	2020-05-17 13:16:22.957382
6088	50	1	15	2020-05-17 13:16:22.970457	2020-05-17 13:16:22.970457
6089	50	1	16	2020-05-17 13:16:23.017485	2020-05-17 13:16:23.017485
6090	50	1	17	2020-05-17 13:16:23.028924	2020-05-17 13:16:23.028924
6091	50	1	18	2020-05-17 13:16:23.042512	2020-05-17 13:16:23.042512
6092	50	1	19	2020-05-17 13:16:23.094227	2020-05-17 13:16:23.094227
6093	50	1	20	2020-05-17 13:16:23.149348	2020-05-17 13:16:23.149348
6094	50	1	21	2020-05-17 13:16:23.161468	2020-05-17 13:16:23.161468
6095	50	1	22	2020-05-17 13:16:23.170078	2020-05-17 13:16:23.170078
6096	50	1	23	2020-05-17 13:16:23.186199	2020-05-17 13:16:23.186199
6097	50	1	24	2020-05-17 13:16:23.197108	2020-05-17 13:16:23.197108
6098	50	1	25	2020-05-17 13:16:23.207856	2020-05-17 13:16:23.207856
6099	50	1	26	2020-05-17 13:16:23.218601	2020-05-17 13:16:23.218601
6100	50	1	27	2020-05-17 13:16:23.233656	2020-05-17 13:16:23.233656
6101	50	1	28	2020-05-17 13:16:23.244101	2020-05-17 13:16:23.244101
6102	50	1	29	2020-05-17 13:16:23.283542	2020-05-17 13:16:23.283542
6103	50	1	30	2020-05-17 13:16:23.33231	2020-05-17 13:16:23.33231
6104	50	1	31	2020-05-17 13:16:23.378164	2020-05-17 13:16:23.378164
6105	50	1	32	2020-05-17 13:16:23.390318	2020-05-17 13:16:23.390318
6106	50	1	33	2020-05-17 13:16:23.403304	2020-05-17 13:16:23.403304
6107	50	1	34	2020-05-17 13:16:23.47476	2020-05-17 13:16:23.47476
6108	50	1	35	2020-05-17 13:16:23.814122	2020-05-17 13:16:23.814122
6109	50	1	36	2020-05-17 13:16:23.894533	2020-05-17 13:16:23.894533
6110	50	1	37	2020-05-17 13:16:23.906296	2020-05-17 13:16:23.906296
6111	50	1	38	2020-05-17 13:16:23.924842	2020-05-17 13:16:23.924842
6112	50	1	39	2020-05-17 13:16:23.933377	2020-05-17 13:16:23.933377
6113	50	1	40	2020-05-17 13:16:23.946596	2020-05-17 13:16:23.946596
6114	50	1	41	2020-05-17 13:16:23.999191	2020-05-17 13:16:23.999191
6115	50	1	42	2020-05-17 13:16:24.012927	2020-05-17 13:16:24.012927
6116	50	1	43	2020-05-17 13:16:24.023169	2020-05-17 13:16:24.023169
6117	50	1	44	2020-05-17 13:16:24.033915	2020-05-17 13:16:24.033915
6118	50	1	45	2020-05-17 13:16:24.044311	2020-05-17 13:16:24.044311
6119	50	1	46	2020-05-17 13:16:24.061852	2020-05-17 13:16:24.061852
6120	50	1	47	2020-05-17 13:16:24.072283	2020-05-17 13:16:24.072283
6121	50	1	48	2020-05-17 13:16:24.082815	2020-05-17 13:16:24.082815
6122	50	1	49	2020-05-17 13:16:24.101525	2020-05-17 13:16:24.101525
6123	50	1	50	2020-05-17 13:16:24.131959	2020-05-17 13:16:24.131959
6124	50	1	51	2020-05-17 13:16:24.150149	2020-05-17 13:16:24.150149
6125	50	1	52	2020-05-17 13:16:24.169581	2020-05-17 13:16:24.169581
6126	50	1	53	2020-05-17 13:16:24.182733	2020-05-17 13:16:24.182733
6127	50	1	54	2020-05-17 13:16:24.19447	2020-05-17 13:16:24.19447
6128	50	1	55	2020-05-17 13:16:24.207302	2020-05-17 13:16:24.207302
6129	50	1	56	2020-05-17 13:16:24.223886	2020-05-17 13:16:24.223886
6130	50	1	57	2020-05-17 13:16:24.2344	2020-05-17 13:16:24.2344
6131	50	1	58	2020-05-17 13:16:24.245272	2020-05-17 13:16:24.245272
6132	50	1	59	2020-05-17 13:16:24.255655	2020-05-17 13:16:24.255655
6133	50	1	60	2020-05-17 13:16:24.266195	2020-05-17 13:16:24.266195
6134	50	1	61	2020-05-17 13:16:24.278625	2020-05-17 13:16:24.278625
6135	50	1	62	2020-05-17 13:16:24.292686	2020-05-17 13:16:24.292686
6136	50	1	63	2020-05-17 13:16:24.307631	2020-05-17 13:16:24.307631
6137	50	1	64	2020-05-17 13:16:24.341992	2020-05-17 13:16:24.341992
6138	50	1	65	2020-05-17 13:16:24.40089	2020-05-17 13:16:24.40089
6139	50	1	66	2020-05-17 13:16:24.414075	2020-05-17 13:16:24.414075
6140	50	1	67	2020-05-17 13:16:24.426982	2020-05-17 13:16:24.426982
6141	50	1	68	2020-05-17 13:16:24.44118	2020-05-17 13:16:24.44118
6142	50	1	69	2020-05-17 13:16:24.45083	2020-05-17 13:16:24.45083
6143	50	1	70	2020-05-17 13:16:24.461625	2020-05-17 13:16:24.461625
6144	50	1	71	2020-05-17 13:16:24.477307	2020-05-17 13:16:24.477307
6145	50	1	72	2020-05-17 13:16:24.58406	2020-05-17 13:16:24.58406
6146	50	1	73	2020-05-17 13:16:24.614061	2020-05-17 13:16:24.614061
6147	50	1	74	2020-05-17 13:16:24.700834	2020-05-17 13:16:24.700834
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.schema_migrations (version) FROM stdin;
20200124155156
20200125181134
20191026195333
20200125182209
20200125182742
20200125183145
20200125193917
20200126175828
20200303001223
20200310002949
20200427192037
20200428173731
20200428174026
20200428174042
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, created_at, updated_at, full_name) FROM stdin;
2	jordan@creatio.works	$2a$11$oBdpjIH7F6/vy9hZ4edj6ukV1gGO4WgPgWg.l/pt7tZgUmTjDO/CK	\N	\N	\N	2020-01-31 03:39:18.800446	2020-01-31 03:39:18.800446	jordan mcmahan
1	david@creatio.works	$2a$11$4RkM2ublyFwh9/VuIZroI.iMZG7DGwKy3OErUFSW87UvJ9ZoF7K7i	\N	\N	\N	2020-01-25 18:14:40.684753	2020-01-25 20:55:10.563121	david lee
\.


--
-- Name: enneagram_numbers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.enneagram_numbers_id_seq', 9, true);


--
-- Name: enneagram_scores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.enneagram_scores_id_seq', 1, false);


--
-- Name: pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.pages_id_seq', 1, false);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.posts_id_seq', 1, false);


--
-- Name: questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.questions_id_seq', 74, true);


--
-- Name: responses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.responses_id_seq', 6147, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: enneagram_numbers enneagram_numbers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.enneagram_numbers
    ADD CONSTRAINT enneagram_numbers_pkey PRIMARY KEY (id);


--
-- Name: enneagram_scores enneagram_scores_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.enneagram_scores
    ADD CONSTRAINT enneagram_scores_pkey PRIMARY KEY (id);


--
-- Name: pages pages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_pkey PRIMARY KEY (id);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: questions questions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (id);


--
-- Name: responses responses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.responses
    ADD CONSTRAINT responses_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_enneagram_scores_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_enneagram_scores_on_user_id ON public.enneagram_scores USING btree (user_id);


--
-- Name: index_questions_on_enneagram_number_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_questions_on_enneagram_number_id ON public.questions USING btree (enneagram_number_id);


--
-- Name: index_responses_on_question_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_responses_on_question_id ON public.responses USING btree (question_id);


--
-- Name: index_responses_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_responses_on_user_id ON public.responses USING btree (user_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: responses fk_rails_2bd9a0753e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.responses
    ADD CONSTRAINT fk_rails_2bd9a0753e FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: responses fk_rails_325af149a3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.responses
    ADD CONSTRAINT fk_rails_325af149a3 FOREIGN KEY (question_id) REFERENCES public.questions(id);


--
-- Name: questions fk_rails_a0d7a9a793; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT fk_rails_a0d7a9a793 FOREIGN KEY (enneagram_number_id) REFERENCES public.enneagram_numbers(id);


--
-- Name: enneagram_scores fk_rails_c369535665; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.enneagram_scores
    ADD CONSTRAINT fk_rails_c369535665 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

