--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: addresses; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE addresses (
    id integer NOT NULL,
    firstname character varying(255),
    lastname character varying(255),
    address1 character varying(255),
    address2 character varying(255),
    city character varying(255),
    state_id integer,
    zipcode character varying(255),
    country_id integer,
    phone character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    state_name character varying(255),
    alternative_phone character varying(255)
);


--
-- Name: addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE addresses_id_seq OWNED BY addresses.id;


--
-- Name: adjustments; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE adjustments (
    id integer NOT NULL,
    order_id integer,
    amount numeric(8,2) DEFAULT NULL::numeric,
    label character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    source_id integer,
    source_type character varying(255),
    mandatory boolean,
    locked boolean,
    originator_id integer,
    originator_type character varying(255)
);


--
-- Name: adjustments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE adjustments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: adjustments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE adjustments_id_seq OWNED BY adjustments.id;


--
-- Name: amazon_items; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE amazon_items (
    id integer NOT NULL,
    asin character varying(255),
    name character varying(255),
    image_url character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: amazon_items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE amazon_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: amazon_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE amazon_items_id_seq OWNED BY amazon_items.id;


--
-- Name: assets; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE assets (
    id integer NOT NULL,
    viewable_id integer,
    viewable_type character varying(50),
    attachment_content_type character varying(255),
    attachment_file_name character varying(255),
    attachment_size integer,
    "position" integer,
    type character varying(75),
    attachment_updated_at timestamp without time zone,
    attachment_width integer,
    attachment_height integer,
    alt text
);


--
-- Name: assets_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE assets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: assets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE assets_id_seq OWNED BY assets.id;


--
-- Name: auctions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE auctions (
    id integer NOT NULL,
    item_id integer,
    pool_id integer,
    start_time timestamp without time zone,
    end_interval integer,
    timezone integer,
    require_pool_membership boolean,
    auction_type character varying(255),
    status character varying(255),
    winning_bid_id integer,
    parent_type character varying(255),
    parent_id integer,
    children_count integer DEFAULT 0,
    level_cache integer DEFAULT 0,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: auctions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auctions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: auctions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auctions_id_seq OWNED BY auctions.id;


--
-- Name: authentication_methods; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE authentication_methods (
    id integer NOT NULL,
    environment character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: authentication_methods_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authentication_methods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: authentication_methods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authentication_methods_id_seq OWNED BY authentication_methods.id;


--
-- Name: bids; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bids (
    id integer NOT NULL,
    user_id integer,
    auction_id integer,
    effective_at timestamp without time zone,
    amount numeric(8,2),
    bidcount integer,
    bid_type character varying(255),
    engine_name character varying(255),
    engine_settings character varying(255),
    parent_type character varying(255),
    parent_id integer,
    children_count integer DEFAULT 0,
    level_cache integer DEFAULT 0,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: bids_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE bids_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: bids_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE bids_id_seq OWNED BY bids.id;


--
-- Name: calculators; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE calculators (
    id integer NOT NULL,
    type character varying(255),
    calculable_id integer NOT NULL,
    calculable_type character varying(255) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: calculators_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE calculators_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: calculators_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE calculators_id_seq OWNED BY calculators.id;


--
-- Name: configurations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE configurations (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    type character varying(50)
);


--
-- Name: configurations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE configurations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: configurations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE configurations_id_seq OWNED BY configurations.id;


--
-- Name: contact_topics; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE contact_topics (
    id integer NOT NULL,
    name character varying(255),
    emails character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: contact_topics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE contact_topics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: contact_topics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE contact_topics_id_seq OWNED BY contact_topics.id;


--
-- Name: countries; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE countries (
    id integer NOT NULL,
    iso_name character varying(255),
    iso character varying(255),
    name character varying(255),
    iso3 character varying(255),
    numcode integer
);


--
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE countries_id_seq OWNED BY countries.id;


--
-- Name: promotions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE promotions (
    id integer NOT NULL,
    code character varying(255),
    description character varying(255),
    usage_limit integer,
    combine boolean,
    expires_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    starts_at timestamp without time zone,
    match_policy character varying(255) DEFAULT 'all'::character varying,
    name character varying(255)
);


--
-- Name: coupons_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE coupons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: coupons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE coupons_id_seq OWNED BY promotions.id;


--
-- Name: creditcards; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE creditcards (
    id integer NOT NULL,
    month character varying(255),
    year character varying(255),
    cc_type character varying(255),
    last_digits character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    start_month character varying(255),
    start_year character varying(255),
    issue_number character varying(255),
    address_id integer,
    gateway_customer_profile_id character varying(255),
    gateway_payment_profile_id character varying(255)
);


--
-- Name: creditcards_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE creditcards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: creditcards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE creditcards_id_seq OWNED BY creditcards.id;


--
-- Name: gateways; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE gateways (
    id integer NOT NULL,
    type character varying(255),
    name character varying(255),
    description text,
    active boolean DEFAULT true,
    environment character varying(255) DEFAULT 'development'::character varying,
    server character varying(255) DEFAULT 'test'::character varying,
    test_mode boolean DEFAULT true,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: gateways_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE gateways_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: gateways_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE gateways_id_seq OWNED BY gateways.id;


--
-- Name: histories; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE histories (
    id integer NOT NULL,
    message character varying(255),
    username character varying(255),
    item integer,
    "table" character varying(255),
    month smallint,
    year bigint,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: histories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE histories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: histories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE histories_id_seq OWNED BY histories.id;


--
-- Name: inventory_units; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE inventory_units (
    id integer NOT NULL,
    variant_id integer,
    order_id integer,
    state character varying(255),
    lock_version integer DEFAULT 0,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    shipment_id integer,
    return_authorization_id integer
);


--
-- Name: inventory_units_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE inventory_units_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: inventory_units_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE inventory_units_id_seq OWNED BY inventory_units.id;


--
-- Name: line_items; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE line_items (
    id integer NOT NULL,
    order_id integer,
    variant_id integer,
    quantity integer NOT NULL,
    price numeric(8,2) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: line_items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE line_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: line_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE line_items_id_seq OWNED BY line_items.id;


--
-- Name: locations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE locations (
    id integer NOT NULL,
    name character varying(255),
    street character varying(255),
    street2 character varying(255),
    city character varying(255),
    state character varying(255),
    country character varying(255),
    postal_code character varying(16),
    lat numeric(15,10),
    lng numeric(15,10)
);


--
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE locations_id_seq OWNED BY locations.id;


--
-- Name: log_entries; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE log_entries (
    id integer NOT NULL,
    source_id integer,
    source_type character varying(255),
    details text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: log_entries_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE log_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: log_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE log_entries_id_seq OWNED BY log_entries.id;


--
-- Name: mail_methods; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE mail_methods (
    id integer NOT NULL,
    environment character varying(255),
    active boolean DEFAULT true,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: mail_methods_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE mail_methods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: mail_methods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE mail_methods_id_seq OWNED BY mail_methods.id;


--
-- Name: option_types; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE option_types (
    id integer NOT NULL,
    name character varying(100),
    presentation character varying(100),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: option_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE option_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: option_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE option_types_id_seq OWNED BY option_types.id;


--
-- Name: option_types_prototypes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE option_types_prototypes (
    prototype_id integer,
    option_type_id integer
);


--
-- Name: option_values; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE option_values (
    id integer NOT NULL,
    option_type_id integer,
    name character varying(255),
    "position" integer,
    presentation character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: option_values_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE option_values_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: option_values_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE option_values_id_seq OWNED BY option_values.id;


--
-- Name: option_values_variants; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE option_values_variants (
    variant_id integer,
    option_value_id integer
);


--
-- Name: orders; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE orders (
    id integer NOT NULL,
    user_id integer,
    number character varying(15),
    item_total numeric(8,2) DEFAULT 0.0 NOT NULL,
    total numeric(8,2) DEFAULT 0.0 NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    state character varying(255),
    adjustment_total numeric(8,2) DEFAULT 0.0 NOT NULL,
    credit_total numeric(8,2) DEFAULT 0.0 NOT NULL,
    completed_at timestamp without time zone,
    bill_address_id integer,
    ship_address_id integer,
    payment_total numeric(8,2) DEFAULT 0.0,
    shipping_method_id integer,
    shipment_state character varying(255),
    payment_state character varying(255),
    email character varying(255),
    special_instructions text
);


--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE orders_id_seq OWNED BY orders.id;


--
-- Name: payment_methods; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE payment_methods (
    id integer NOT NULL,
    type character varying(255),
    name character varying(255),
    description text,
    active boolean DEFAULT true,
    environment character varying(255) DEFAULT 'development'::character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    display_on character varying(255) DEFAULT NULL::character varying
);


--
-- Name: payment_methods_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE payment_methods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: payment_methods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE payment_methods_id_seq OWNED BY payment_methods.id;


--
-- Name: payments; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE payments (
    id integer NOT NULL,
    order_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    amount numeric(8,2) DEFAULT 0.0 NOT NULL,
    source_id integer,
    source_type character varying(255),
    payment_method_id integer,
    state character varying(255),
    response_code character varying(255),
    avs_response character varying(255)
);


--
-- Name: payments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE payments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: payments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE payments_id_seq OWNED BY payments.id;


--
-- Name: pictures; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE pictures (
    id integer NOT NULL,
    target_type character varying(255),
    target_id integer,
    picture_url character varying(255),
    caption character varying(255),
    "order" integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    image_file_name character varying(255),
    image_content_type character varying(255),
    image_file_size integer,
    image_updated_at timestamp without time zone
);


--
-- Name: pictures_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pictures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: pictures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pictures_id_seq OWNED BY pictures.id;


--
-- Name: pools; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE pools (
    id integer NOT NULL,
    name character varying(255),
    type character varying(255),
    scoped_to_attributes character varying(255),
    scoped_to_block text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: pools_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pools_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: pools_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pools_id_seq OWNED BY pools.id;


--
-- Name: preferences; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE preferences (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    owner_id integer NOT NULL,
    owner_type character varying(50) NOT NULL,
    group_id integer,
    group_type character varying(50),
    value text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: preferences_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE preferences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: preferences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE preferences_id_seq OWNED BY preferences.id;


--
-- Name: product_groups; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE product_groups (
    id integer NOT NULL,
    name character varying(255),
    permalink character varying(255),
    "order" character varying(255)
);


--
-- Name: product_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE product_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: product_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE product_groups_id_seq OWNED BY product_groups.id;


--
-- Name: product_groups_products; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE product_groups_products (
    product_id integer,
    product_group_id integer
);


--
-- Name: product_option_types; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE product_option_types (
    id integer NOT NULL,
    product_id integer,
    option_type_id integer,
    "position" integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: product_option_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE product_option_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: product_option_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE product_option_types_id_seq OWNED BY product_option_types.id;


--
-- Name: product_properties; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE product_properties (
    id integer NOT NULL,
    product_id integer,
    property_id integer,
    value character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: product_properties_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE product_properties_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: product_properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE product_properties_id_seq OWNED BY product_properties.id;


--
-- Name: product_scopes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE product_scopes (
    id integer NOT NULL,
    product_group_id integer,
    name character varying(255),
    arguments text
);


--
-- Name: product_scopes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE product_scopes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: product_scopes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE product_scopes_id_seq OWNED BY product_scopes.id;


--
-- Name: product_translations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE product_translations (
    id integer NOT NULL,
    product_id integer,
    locale character varying(255),
    name character varying(255),
    description text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: product_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE product_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: product_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE product_translations_id_seq OWNED BY product_translations.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE products (
    id integer NOT NULL,
    name character varying(255) DEFAULT ''::character varying NOT NULL,
    description text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    permalink character varying(255),
    available_on timestamp without time zone,
    tax_category_id integer,
    shipping_category_id integer,
    deleted_at timestamp without time zone,
    meta_description character varying(255),
    meta_keywords character varying(255),
    count_on_hand integer DEFAULT 0 NOT NULL
);


--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE products_id_seq OWNED BY products.id;


--
-- Name: products_promotion_rules; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE products_promotion_rules (
    product_id integer,
    promotion_rule_id integer
);


--
-- Name: products_taxons; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE products_taxons (
    product_id integer,
    taxon_id integer
);


--
-- Name: promotion_rules; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE promotion_rules (
    id integer NOT NULL,
    promotion_id integer,
    user_id integer,
    product_group_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    type character varying(255)
);


--
-- Name: promotion_rules_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE promotion_rules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: promotion_rules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE promotion_rules_id_seq OWNED BY promotion_rules.id;


--
-- Name: promotion_rules_users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE promotion_rules_users (
    user_id integer,
    promotion_rule_id integer
);


--
-- Name: properties; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE properties (
    id integer NOT NULL,
    name character varying(255),
    presentation character varying(255) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: properties_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE properties_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE properties_id_seq OWNED BY properties.id;


--
-- Name: properties_prototypes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE properties_prototypes (
    prototype_id integer,
    property_id integer
);


--
-- Name: prototypes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE prototypes (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: prototypes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE prototypes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: prototypes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE prototypes_id_seq OWNED BY prototypes.id;


--
-- Name: return_authorizations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE return_authorizations (
    id integer NOT NULL,
    number character varying(255),
    amount numeric(8,2) DEFAULT 0.0 NOT NULL,
    order_id integer,
    reason text,
    state character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: return_authorizations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE return_authorizations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: return_authorizations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE return_authorizations_id_seq OWNED BY return_authorizations.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE roles (
    id integer NOT NULL,
    name character varying(255)
);


--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE roles_id_seq OWNED BY roles.id;


--
-- Name: roles_users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE roles_users (
    role_id integer,
    user_id integer
);


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: shipments; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE shipments (
    id integer NOT NULL,
    order_id integer,
    shipping_method_id integer,
    tracking character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    number character varying(255),
    cost numeric(8,2),
    shipped_at timestamp without time zone,
    address_id integer,
    state character varying(255)
);


--
-- Name: shipments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE shipments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: shipments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE shipments_id_seq OWNED BY shipments.id;


--
-- Name: shipping_categories; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE shipping_categories (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: shipping_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE shipping_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: shipping_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE shipping_categories_id_seq OWNED BY shipping_categories.id;


--
-- Name: shipping_methods; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE shipping_methods (
    id integer NOT NULL,
    zone_id integer,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    display_on character varying(255) DEFAULT NULL::character varying
);


--
-- Name: shipping_methods_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE shipping_methods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: shipping_methods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE shipping_methods_id_seq OWNED BY shipping_methods.id;


--
-- Name: state_events; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE state_events (
    id integer NOT NULL,
    stateful_id integer,
    user_id integer,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    previous_state character varying(255),
    stateful_type character varying(255)
);


--
-- Name: state_events_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE state_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: state_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE state_events_id_seq OWNED BY state_events.id;


--
-- Name: states; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE states (
    id integer NOT NULL,
    name character varying(255),
    abbr character varying(255),
    country_id integer
);


--
-- Name: states_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE states_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: states_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE states_id_seq OWNED BY states.id;


--
-- Name: tax_categories; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE tax_categories (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    is_default boolean DEFAULT false
);


--
-- Name: tax_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tax_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: tax_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tax_categories_id_seq OWNED BY tax_categories.id;


--
-- Name: tax_rates; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE tax_rates (
    id integer NOT NULL,
    zone_id integer,
    amount numeric(8,4),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    tax_category_id integer
);


--
-- Name: tax_rates_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tax_rates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: tax_rates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tax_rates_id_seq OWNED BY tax_rates.id;


--
-- Name: taxon_translations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE taxon_translations (
    id integer NOT NULL,
    taxon_id integer,
    locale character varying(255),
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: taxon_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE taxon_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: taxon_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE taxon_translations_id_seq OWNED BY taxon_translations.id;


--
-- Name: taxonomies; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE taxonomies (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: taxonomies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE taxonomies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: taxonomies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE taxonomies_id_seq OWNED BY taxonomies.id;


--
-- Name: taxons; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE taxons (
    id integer NOT NULL,
    taxonomy_id integer NOT NULL,
    parent_id integer,
    "position" integer DEFAULT 0,
    name character varying(255) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    permalink character varying(255),
    lft integer,
    rgt integer,
    icon_file_name character varying(255),
    icon_content_type character varying(255),
    icon_file_size integer,
    icon_updated_at timestamp without time zone,
    description text
);


--
-- Name: taxons_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE taxons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: taxons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE taxons_id_seq OWNED BY taxons.id;


--
-- Name: testimonials; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE testimonials (
    id integer NOT NULL,
    name character varying(255),
    location character varying(255),
    description text,
    featured boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: testimonials_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE testimonials_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: testimonials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE testimonials_id_seq OWNED BY testimonials.id;


--
-- Name: trackers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE trackers (
    id integer NOT NULL,
    environment character varying(255),
    analytics_id character varying(255),
    active boolean DEFAULT true,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: trackers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE trackers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: trackers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE trackers_id_seq OWNED BY trackers.id;


--
-- Name: user_authentications; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE user_authentications (
    id integer NOT NULL,
    user_id integer,
    provider character varying(255),
    uid character varying(255),
    nickname character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: user_authentications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE user_authentications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: user_authentications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE user_authentications_id_seq OWNED BY user_authentications.id;


--
-- Name: user_locations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE user_locations (
    id integer NOT NULL,
    user_id integer,
    location_id integer,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: user_locations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE user_locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: user_locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE user_locations_id_seq OWNED BY user_locations.id;


--
-- Name: user_tokens; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE user_tokens (
    id integer NOT NULL,
    user_id integer,
    provider character varying(255),
    uid character varying(255),
    token character varying(255),
    secret character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: user_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE user_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: user_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE user_tokens_id_seq OWNED BY user_tokens.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying(255),
    encrypted_password character varying(255) DEFAULT NULL::character varying,
    password_salt character varying(255) DEFAULT NULL::character varying,
    remember_token character varying(255),
    remember_created_at character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    persistence_token character varying(255),
    reset_password_token character varying(255),
    perishable_token character varying(255),
    sign_in_count integer DEFAULT 0 NOT NULL,
    failed_attempts integer DEFAULT 0 NOT NULL,
    last_request_at timestamp without time zone,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    login character varying(255) DEFAULT NULL::character varying,
    ship_address_id integer,
    bill_address_id integer,
    authentication_token character varying(255),
    unlock_token character varying(255),
    locked_at timestamp without time zone
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: variants; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE variants (
    id integer NOT NULL,
    product_id integer,
    sku character varying(255) DEFAULT ''::character varying NOT NULL,
    price numeric(8,2) NOT NULL,
    weight numeric(8,2),
    height numeric(8,2),
    width numeric(8,2),
    depth numeric(8,2),
    deleted_at timestamp without time zone,
    is_master boolean DEFAULT false,
    count_on_hand integer DEFAULT 0 NOT NULL,
    cost_price numeric(8,2) DEFAULT NULL::numeric
);


--
-- Name: variants_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE variants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: variants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE variants_id_seq OWNED BY variants.id;


--
-- Name: zone_members; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE zone_members (
    id integer NOT NULL,
    zone_id integer,
    zoneable_id integer,
    zoneable_type character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: zone_members_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE zone_members_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: zone_members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE zone_members_id_seq OWNED BY zone_members.id;


--
-- Name: zones; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE zones (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: zones_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE zones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: zones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE zones_id_seq OWNED BY zones.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE addresses ALTER COLUMN id SET DEFAULT nextval('addresses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE adjustments ALTER COLUMN id SET DEFAULT nextval('adjustments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE amazon_items ALTER COLUMN id SET DEFAULT nextval('amazon_items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE assets ALTER COLUMN id SET DEFAULT nextval('assets_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE auctions ALTER COLUMN id SET DEFAULT nextval('auctions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE authentication_methods ALTER COLUMN id SET DEFAULT nextval('authentication_methods_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE bids ALTER COLUMN id SET DEFAULT nextval('bids_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE calculators ALTER COLUMN id SET DEFAULT nextval('calculators_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE configurations ALTER COLUMN id SET DEFAULT nextval('configurations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE contact_topics ALTER COLUMN id SET DEFAULT nextval('contact_topics_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE countries ALTER COLUMN id SET DEFAULT nextval('countries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE creditcards ALTER COLUMN id SET DEFAULT nextval('creditcards_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE gateways ALTER COLUMN id SET DEFAULT nextval('gateways_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE histories ALTER COLUMN id SET DEFAULT nextval('histories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE inventory_units ALTER COLUMN id SET DEFAULT nextval('inventory_units_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE line_items ALTER COLUMN id SET DEFAULT nextval('line_items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE locations ALTER COLUMN id SET DEFAULT nextval('locations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE log_entries ALTER COLUMN id SET DEFAULT nextval('log_entries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE mail_methods ALTER COLUMN id SET DEFAULT nextval('mail_methods_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE option_types ALTER COLUMN id SET DEFAULT nextval('option_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE option_values ALTER COLUMN id SET DEFAULT nextval('option_values_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE orders ALTER COLUMN id SET DEFAULT nextval('orders_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE payment_methods ALTER COLUMN id SET DEFAULT nextval('payment_methods_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE payments ALTER COLUMN id SET DEFAULT nextval('payments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE pictures ALTER COLUMN id SET DEFAULT nextval('pictures_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE pools ALTER COLUMN id SET DEFAULT nextval('pools_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE preferences ALTER COLUMN id SET DEFAULT nextval('preferences_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE product_groups ALTER COLUMN id SET DEFAULT nextval('product_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE product_option_types ALTER COLUMN id SET DEFAULT nextval('product_option_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE product_properties ALTER COLUMN id SET DEFAULT nextval('product_properties_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE product_scopes ALTER COLUMN id SET DEFAULT nextval('product_scopes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE product_translations ALTER COLUMN id SET DEFAULT nextval('product_translations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE products ALTER COLUMN id SET DEFAULT nextval('products_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE promotion_rules ALTER COLUMN id SET DEFAULT nextval('promotion_rules_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE promotions ALTER COLUMN id SET DEFAULT nextval('coupons_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE properties ALTER COLUMN id SET DEFAULT nextval('properties_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE prototypes ALTER COLUMN id SET DEFAULT nextval('prototypes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE return_authorizations ALTER COLUMN id SET DEFAULT nextval('return_authorizations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE roles ALTER COLUMN id SET DEFAULT nextval('roles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE shipments ALTER COLUMN id SET DEFAULT nextval('shipments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE shipping_categories ALTER COLUMN id SET DEFAULT nextval('shipping_categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE shipping_methods ALTER COLUMN id SET DEFAULT nextval('shipping_methods_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE state_events ALTER COLUMN id SET DEFAULT nextval('state_events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE states ALTER COLUMN id SET DEFAULT nextval('states_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE tax_categories ALTER COLUMN id SET DEFAULT nextval('tax_categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE tax_rates ALTER COLUMN id SET DEFAULT nextval('tax_rates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE taxon_translations ALTER COLUMN id SET DEFAULT nextval('taxon_translations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE taxonomies ALTER COLUMN id SET DEFAULT nextval('taxonomies_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE taxons ALTER COLUMN id SET DEFAULT nextval('taxons_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE testimonials ALTER COLUMN id SET DEFAULT nextval('testimonials_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE trackers ALTER COLUMN id SET DEFAULT nextval('trackers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE user_authentications ALTER COLUMN id SET DEFAULT nextval('user_authentications_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE user_locations ALTER COLUMN id SET DEFAULT nextval('user_locations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE user_tokens ALTER COLUMN id SET DEFAULT nextval('user_tokens_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE variants ALTER COLUMN id SET DEFAULT nextval('variants_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE zone_members ALTER COLUMN id SET DEFAULT nextval('zone_members_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE zones ALTER COLUMN id SET DEFAULT nextval('zones_id_seq'::regclass);


--
-- Name: addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);


--
-- Name: adjustments_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY adjustments
    ADD CONSTRAINT adjustments_pkey PRIMARY KEY (id);


--
-- Name: amazon_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY amazon_items
    ADD CONSTRAINT amazon_items_pkey PRIMARY KEY (id);


--
-- Name: assets_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY assets
    ADD CONSTRAINT assets_pkey PRIMARY KEY (id);


--
-- Name: auctions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auctions
    ADD CONSTRAINT auctions_pkey PRIMARY KEY (id);


--
-- Name: authentication_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY authentication_methods
    ADD CONSTRAINT authentication_methods_pkey PRIMARY KEY (id);


--
-- Name: bids_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY bids
    ADD CONSTRAINT bids_pkey PRIMARY KEY (id);


--
-- Name: calculators_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY calculators
    ADD CONSTRAINT calculators_pkey PRIMARY KEY (id);


--
-- Name: configurations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY configurations
    ADD CONSTRAINT configurations_pkey PRIMARY KEY (id);


--
-- Name: contact_topics_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY contact_topics
    ADD CONSTRAINT contact_topics_pkey PRIMARY KEY (id);


--
-- Name: countries_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- Name: coupons_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY promotions
    ADD CONSTRAINT coupons_pkey PRIMARY KEY (id);


--
-- Name: creditcards_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY creditcards
    ADD CONSTRAINT creditcards_pkey PRIMARY KEY (id);


--
-- Name: gateways_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY gateways
    ADD CONSTRAINT gateways_pkey PRIMARY KEY (id);


--
-- Name: histories_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY histories
    ADD CONSTRAINT histories_pkey PRIMARY KEY (id);


--
-- Name: inventory_units_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY inventory_units
    ADD CONSTRAINT inventory_units_pkey PRIMARY KEY (id);


--
-- Name: line_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY line_items
    ADD CONSTRAINT line_items_pkey PRIMARY KEY (id);


--
-- Name: locations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- Name: log_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY log_entries
    ADD CONSTRAINT log_entries_pkey PRIMARY KEY (id);


--
-- Name: mail_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY mail_methods
    ADD CONSTRAINT mail_methods_pkey PRIMARY KEY (id);


--
-- Name: option_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY option_types
    ADD CONSTRAINT option_types_pkey PRIMARY KEY (id);


--
-- Name: option_values_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY option_values
    ADD CONSTRAINT option_values_pkey PRIMARY KEY (id);


--
-- Name: orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: payment_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY payment_methods
    ADD CONSTRAINT payment_methods_pkey PRIMARY KEY (id);


--
-- Name: payments_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (id);


--
-- Name: pictures_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY pictures
    ADD CONSTRAINT pictures_pkey PRIMARY KEY (id);


--
-- Name: pools_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY pools
    ADD CONSTRAINT pools_pkey PRIMARY KEY (id);


--
-- Name: preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY preferences
    ADD CONSTRAINT preferences_pkey PRIMARY KEY (id);


--
-- Name: product_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY product_groups
    ADD CONSTRAINT product_groups_pkey PRIMARY KEY (id);


--
-- Name: product_option_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY product_option_types
    ADD CONSTRAINT product_option_types_pkey PRIMARY KEY (id);


--
-- Name: product_properties_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY product_properties
    ADD CONSTRAINT product_properties_pkey PRIMARY KEY (id);


--
-- Name: product_scopes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY product_scopes
    ADD CONSTRAINT product_scopes_pkey PRIMARY KEY (id);


--
-- Name: product_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY product_translations
    ADD CONSTRAINT product_translations_pkey PRIMARY KEY (id);


--
-- Name: products_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: promotion_rules_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY promotion_rules
    ADD CONSTRAINT promotion_rules_pkey PRIMARY KEY (id);


--
-- Name: properties_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY properties
    ADD CONSTRAINT properties_pkey PRIMARY KEY (id);


--
-- Name: prototypes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY prototypes
    ADD CONSTRAINT prototypes_pkey PRIMARY KEY (id);


--
-- Name: return_authorizations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY return_authorizations
    ADD CONSTRAINT return_authorizations_pkey PRIMARY KEY (id);


--
-- Name: roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: shipments_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY shipments
    ADD CONSTRAINT shipments_pkey PRIMARY KEY (id);


--
-- Name: shipping_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY shipping_categories
    ADD CONSTRAINT shipping_categories_pkey PRIMARY KEY (id);


--
-- Name: shipping_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY shipping_methods
    ADD CONSTRAINT shipping_methods_pkey PRIMARY KEY (id);


--
-- Name: state_events_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY state_events
    ADD CONSTRAINT state_events_pkey PRIMARY KEY (id);


--
-- Name: states_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY states
    ADD CONSTRAINT states_pkey PRIMARY KEY (id);


--
-- Name: tax_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY tax_categories
    ADD CONSTRAINT tax_categories_pkey PRIMARY KEY (id);


--
-- Name: tax_rates_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY tax_rates
    ADD CONSTRAINT tax_rates_pkey PRIMARY KEY (id);


--
-- Name: taxon_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY taxon_translations
    ADD CONSTRAINT taxon_translations_pkey PRIMARY KEY (id);


--
-- Name: taxonomies_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY taxonomies
    ADD CONSTRAINT taxonomies_pkey PRIMARY KEY (id);


--
-- Name: taxons_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY taxons
    ADD CONSTRAINT taxons_pkey PRIMARY KEY (id);


--
-- Name: testimonials_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY testimonials
    ADD CONSTRAINT testimonials_pkey PRIMARY KEY (id);


--
-- Name: trackers_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY trackers
    ADD CONSTRAINT trackers_pkey PRIMARY KEY (id);


--
-- Name: user_authentications_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY user_authentications
    ADD CONSTRAINT user_authentications_pkey PRIMARY KEY (id);


--
-- Name: user_locations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY user_locations
    ADD CONSTRAINT user_locations_pkey PRIMARY KEY (id);


--
-- Name: user_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY user_tokens
    ADD CONSTRAINT user_tokens_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: variants_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY variants
    ADD CONSTRAINT variants_pkey PRIMARY KEY (id);


--
-- Name: zone_members_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY zone_members
    ADD CONSTRAINT zone_members_pkey PRIMARY KEY (id);


--
-- Name: zones_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY zones
    ADD CONSTRAINT zones_pkey PRIMARY KEY (id);


--
-- Name: index_addresses_on_firstname; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_addresses_on_firstname ON addresses USING btree (firstname);


--
-- Name: index_addresses_on_lastname; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_addresses_on_lastname ON addresses USING btree (lastname);


--
-- Name: index_adjustments_on_order_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_adjustments_on_order_id ON adjustments USING btree (order_id);


--
-- Name: index_assets_on_viewable_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_assets_on_viewable_id ON assets USING btree (viewable_id);


--
-- Name: index_assets_on_viewable_type_and_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_assets_on_viewable_type_and_type ON assets USING btree (viewable_type, type);


--
-- Name: index_configurations_on_name_and_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_configurations_on_name_and_type ON configurations USING btree (name, type);


--
-- Name: index_histories_on_item_and_table_and_month_and_year; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_histories_on_item_and_table_and_month_and_year ON histories USING btree (item, "table", month, year);


--
-- Name: index_inventory_units_on_order_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_inventory_units_on_order_id ON inventory_units USING btree (order_id);


--
-- Name: index_inventory_units_on_shipment_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_inventory_units_on_shipment_id ON inventory_units USING btree (shipment_id);


--
-- Name: index_inventory_units_on_variant_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_inventory_units_on_variant_id ON inventory_units USING btree (variant_id);


--
-- Name: index_line_items_on_order_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_line_items_on_order_id ON line_items USING btree (order_id);


--
-- Name: index_line_items_on_variant_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_line_items_on_variant_id ON line_items USING btree (variant_id);


--
-- Name: index_option_values_variants_on_variant_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_option_values_variants_on_variant_id ON option_values_variants USING btree (variant_id);


--
-- Name: index_option_values_variants_on_variant_id_and_option_value_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_option_values_variants_on_variant_id_and_option_value_id ON option_values_variants USING btree (variant_id, option_value_id);


--
-- Name: index_orders_on_number; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_orders_on_number ON orders USING btree (number);


--
-- Name: index_product_groups_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_product_groups_on_name ON product_groups USING btree (name);


--
-- Name: index_product_groups_on_permalink; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_product_groups_on_permalink ON product_groups USING btree (permalink);


--
-- Name: index_product_properties_on_product_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_product_properties_on_product_id ON product_properties USING btree (product_id);


--
-- Name: index_product_scopes_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_product_scopes_on_name ON product_scopes USING btree (name);


--
-- Name: index_product_scopes_on_product_group_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_product_scopes_on_product_group_id ON product_scopes USING btree (product_group_id);


--
-- Name: index_product_translations_on_product_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_product_translations_on_product_id ON product_translations USING btree (product_id);


--
-- Name: index_products_on_available_on; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_products_on_available_on ON products USING btree (available_on);


--
-- Name: index_products_on_deleted_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_products_on_deleted_at ON products USING btree (deleted_at);


--
-- Name: index_products_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_products_on_name ON products USING btree (name);


--
-- Name: index_products_on_permalink; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_products_on_permalink ON products USING btree (permalink);


--
-- Name: index_products_promotion_rules_on_product_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_products_promotion_rules_on_product_id ON products_promotion_rules USING btree (product_id);


--
-- Name: index_products_promotion_rules_on_promotion_rule_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_products_promotion_rules_on_promotion_rule_id ON products_promotion_rules USING btree (promotion_rule_id);


--
-- Name: index_products_taxons_on_product_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_products_taxons_on_product_id ON products_taxons USING btree (product_id);


--
-- Name: index_products_taxons_on_taxon_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_products_taxons_on_taxon_id ON products_taxons USING btree (taxon_id);


--
-- Name: index_promotion_rules_on_product_group_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_promotion_rules_on_product_group_id ON promotion_rules USING btree (product_group_id);


--
-- Name: index_promotion_rules_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_promotion_rules_on_user_id ON promotion_rules USING btree (user_id);


--
-- Name: index_promotion_rules_users_on_promotion_rule_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_promotion_rules_users_on_promotion_rule_id ON promotion_rules_users USING btree (promotion_rule_id);


--
-- Name: index_promotion_rules_users_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_promotion_rules_users_on_user_id ON promotion_rules_users USING btree (user_id);


--
-- Name: index_roles_users_on_role_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_roles_users_on_role_id ON roles_users USING btree (role_id);


--
-- Name: index_roles_users_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_roles_users_on_user_id ON roles_users USING btree (user_id);


--
-- Name: index_shipments_on_number; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_shipments_on_number ON shipments USING btree (number);


--
-- Name: index_taxon_translations_on_taxon_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_taxon_translations_on_taxon_id ON taxon_translations USING btree (taxon_id);


--
-- Name: index_taxons_on_parent_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_taxons_on_parent_id ON taxons USING btree (parent_id);


--
-- Name: index_taxons_on_permalink; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_taxons_on_permalink ON taxons USING btree (permalink);


--
-- Name: index_taxons_on_taxonomy_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_taxons_on_taxonomy_id ON taxons USING btree (taxonomy_id);


--
-- Name: index_users_on_persistence_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_users_on_persistence_token ON users USING btree (persistence_token);


--
-- Name: index_variants_on_product_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_variants_on_product_id ON variants USING btree (product_id);


--
-- Name: ix_prefs_on_owner_attr_pref; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX ix_prefs_on_owner_attr_pref ON preferences USING btree (owner_id, owner_type, name, group_id, group_type);


--
-- Name: lat_lng_index; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX lat_lng_index ON locations USING btree (lat, lng);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

INSERT INTO schema_migrations (version) VALUES ('20090823005402');

INSERT INTO schema_migrations (version) VALUES ('20090904192342');

INSERT INTO schema_migrations (version) VALUES ('20090923100315');

INSERT INTO schema_migrations (version) VALUES ('20091007134354');

INSERT INTO schema_migrations (version) VALUES ('20091008091614');

INSERT INTO schema_migrations (version) VALUES ('20091012120519');

INSERT INTO schema_migrations (version) VALUES ('20091015110842');

INSERT INTO schema_migrations (version) VALUES ('20091015153048');

INSERT INTO schema_migrations (version) VALUES ('20091016174634');

INSERT INTO schema_migrations (version) VALUES ('20091017175558');

INSERT INTO schema_migrations (version) VALUES ('20091021133257');

INSERT INTO schema_migrations (version) VALUES ('20091104151730');

INSERT INTO schema_migrations (version) VALUES ('20091126190904');

INSERT INTO schema_migrations (version) VALUES ('20091209153045');

INSERT INTO schema_migrations (version) VALUES ('20091209202200');

INSERT INTO schema_migrations (version) VALUES ('20091211203813');

INSERT INTO schema_migrations (version) VALUES ('20091212161118');

INSERT INTO schema_migrations (version) VALUES ('20091213222815');

INSERT INTO schema_migrations (version) VALUES ('20091214183826');

INSERT INTO schema_migrations (version) VALUES ('20100105090147');

INSERT INTO schema_migrations (version) VALUES ('20100105132138');

INSERT INTO schema_migrations (version) VALUES ('20100107141738');

INSERT INTO schema_migrations (version) VALUES ('20100111205525');

INSERT INTO schema_migrations (version) VALUES ('20100112151511');

INSERT INTO schema_migrations (version) VALUES ('20100113090919');

INSERT INTO schema_migrations (version) VALUES ('20100113203104');

INSERT INTO schema_migrations (version) VALUES ('20100121160010');

INSERT INTO schema_migrations (version) VALUES ('20100121183934');

INSERT INTO schema_migrations (version) VALUES ('20100125145351');

INSERT INTO schema_migrations (version) VALUES ('20100126103714');

INSERT INTO schema_migrations (version) VALUES ('20100209025806');

INSERT INTO schema_migrations (version) VALUES ('20100209144531');

INSERT INTO schema_migrations (version) VALUES ('20100213103131');

INSERT INTO schema_migrations (version) VALUES ('20100214212536');

INSERT INTO schema_migrations (version) VALUES ('20100223170312');

INSERT INTO schema_migrations (version) VALUES ('20100223183812');

INSERT INTO schema_migrations (version) VALUES ('20100224153127');

INSERT INTO schema_migrations (version) VALUES ('20100301163454');

INSERT INTO schema_migrations (version) VALUES ('20100306153445');

INSERT INTO schema_migrations (version) VALUES ('20100317120946');

INSERT INTO schema_migrations (version) VALUES ('20100419190933');

INSERT INTO schema_migrations (version) VALUES ('20100419194457');

INSERT INTO schema_migrations (version) VALUES ('20100426100726');

INSERT INTO schema_migrations (version) VALUES ('20100427121301');

INSERT INTO schema_migrations (version) VALUES ('20100501084722');

INSERT INTO schema_migrations (version) VALUES ('20100501095202');

INSERT INTO schema_migrations (version) VALUES ('20100502163939');

INSERT INTO schema_migrations (version) VALUES ('20100504142133');

INSERT INTO schema_migrations (version) VALUES ('20100506180619');

INSERT INTO schema_migrations (version) VALUES ('20100506185838');

INSERT INTO schema_migrations (version) VALUES ('20100528155333');

INSERT INTO schema_migrations (version) VALUES ('20100528185820');

INSERT INTO schema_migrations (version) VALUES ('20100605152042');

INSERT INTO schema_migrations (version) VALUES ('20100624110730');

INSERT INTO schema_migrations (version) VALUES ('20100624123336');

INSERT INTO schema_migrations (version) VALUES ('20100624175547');

INSERT INTO schema_migrations (version) VALUES ('20100811163637');

INSERT INTO schema_migrations (version) VALUES ('20100811205836');

INSERT INTO schema_migrations (version) VALUES ('20100812162326');

INSERT INTO schema_migrations (version) VALUES ('20100813023502');

INSERT INTO schema_migrations (version) VALUES ('20100813185745');

INSERT INTO schema_migrations (version) VALUES ('20100816212146');

INSERT INTO schema_migrations (version) VALUES ('20100817152723');

INSERT INTO schema_migrations (version) VALUES ('20100819170125');

INSERT INTO schema_migrations (version) VALUES ('20100820135707');

INSERT INTO schema_migrations (version) VALUES ('20100901171814');

INSERT INTO schema_migrations (version) VALUES ('20100903203949');

INSERT INTO schema_migrations (version) VALUES ('20100923095305');

INSERT INTO schema_migrations (version) VALUES ('20100923162011');

INSERT INTO schema_migrations (version) VALUES ('20100929151905');

INSERT INTO schema_migrations (version) VALUES ('20101008190536');

INSERT INTO schema_migrations (version) VALUES ('20101026184700');

INSERT INTO schema_migrations (version) VALUES ('20101026184714');

INSERT INTO schema_migrations (version) VALUES ('20101026184746');

INSERT INTO schema_migrations (version) VALUES ('20101026184808');

INSERT INTO schema_migrations (version) VALUES ('20101026184833');

INSERT INTO schema_migrations (version) VALUES ('20101026184855');

INSERT INTO schema_migrations (version) VALUES ('20101026184916');

INSERT INTO schema_migrations (version) VALUES ('20101026184932');

INSERT INTO schema_migrations (version) VALUES ('20101026184959');

INSERT INTO schema_migrations (version) VALUES ('20101026185022');

INSERT INTO schema_migrations (version) VALUES ('20101026192225');

INSERT INTO schema_migrations (version) VALUES ('20101028151745');

INSERT INTO schema_migrations (version) VALUES ('20101101185116');

INSERT INTO schema_migrations (version) VALUES ('20101103212716');

INSERT INTO schema_migrations (version) VALUES ('20101111133551');

INSERT INTO schema_migrations (version) VALUES ('20101117031806');

INSERT INTO schema_migrations (version) VALUES ('20101107175511');

INSERT INTO schema_migrations (version) VALUES ('20101107185551');

INSERT INTO schema_migrations (version) VALUES ('20101117212408');

INSERT INTO schema_migrations (version) VALUES ('20101207152830');

INSERT INTO schema_migrations (version) VALUES ('20101122153512');

INSERT INTO schema_migrations (version) VALUES ('20101122222055');

INSERT INTO schema_migrations (version) VALUES ('20101210131324');