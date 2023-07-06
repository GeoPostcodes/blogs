CREATE OR REPLACE FUNCTION zips.voronoi_geom(p_geom geometry)
RETURNS void
LANGUAGE plpgsql
AS $function$
DECLARE
begin
   --
   -- SETUP
   --
   DROP TABLE IF EXISTS zips.voronoi;
   CREATE TABLE IF NOT EXISTS zips.voronoi(
       gid serial4 NOT NULL,
       zip varchar(20) NULL,
       geom public.geometry(multipolygon, 3857) NULL
   );
   CREATE INDEX IF NOT EXISTS zips_voronoi_sidx ON zips.voronoi USING gist (geom);
   CREATE TABLE IF NOT EXISTS zips.voronoi_pts (
       zip varchar(20) NULL,
       geom public.geometry(point, 3857) NULL
   );
   CREATE INDEX IF NOT EXISTS zips_voronoi_pts_sidx ON zips.voronoi_pts USING gist (geom);
   -- SELECT VORONOI POINTS (seeds) from the target geometry p_geom
   TRUNCATE TABLE zips.voronoi_pts;
   INSERT INTO zips.voronoi_pts(zip, geom)
     SELECT pt.code_postal, pt.geom
     FROM zips.source_points pt
     WHERE ST_Contains(p_geom, pt.geom);
   -- CREATE VORONOI polygons
   TRUNCATE TABLE zips.voronoi;
   INSERT INTO zips.voronoi(geom)
     SELECT ST_Multi(ST_Intersection((ST_Dump(geom)).geom, p_geom)) FROM (
       SELECT ST_CollectionExtract(ST_VoronoiPolygons(geom, 0.0, p_geom), 3) as geom
       FROM (SELECT ST_Collect(geom) AS geom FROM zips.voronoi_pts) p
     ) polys;
    -- label Voronoi polygons with corresponding zips from the points data
    UPDATE zips.voronoi a set zip = p.zip
    FROM zips.voronoi_pts p
    WHERE ST_Contains(a.geom, p.geom);
END;
$function$
;