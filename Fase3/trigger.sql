create or replace TRIGGER exceso_horas
BEFORE INSERT OR UPDATE ON parte FOR EACH ROW
DECLARE 
    minutos NUMBER;
    horas NUMBER;
BEGIN
    minutos := round((to_date ('1970-01-01 ' || to_char(:new.total_horas_parte, 'HH24:MI:SS'), 'YYYY-MM-DD HH24:MI:SS') - to_date ('1970-01-01 8:00:00', 'YYYY-MM-DD HH24:MI:SS'))*24*60);
    IF minutos > 0  THEN
        horas := round(minutos/60);
        :new.exceso_horas:= to_date( to_char('1970-01-01 ' || horas || ':' || minutos || ':' || '00'), 'YYYY-MM-DD HH24:MI:SS');
    END IF;
END;