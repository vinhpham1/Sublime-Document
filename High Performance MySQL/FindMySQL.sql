SET @CAN_READ := 1 << 0;
on duplicate key update
FLUSH TABLES WITH READ LOCK;

alter column vs modify column
At the scale of terabytes, locating individual rows doesn’t make sense; indexes are replaced by per-block metadata