local meta = FindMetaTable( "Angle" )

-- Nothing in here, still leaving this file here just in case

--[[---------------------------------------------------------
	Angle Snap to nearest interval of degrees
-----------------------------------------------------------]]
function meta:SnapTo( component, degrees )

	if ( degrees == 0 ) then ErrorNoHalt( "The snap degrees must be non-zero.\n" ); return self; end
	if ( !self[ component ] ) then ErrorNoHalt( "You must choose a valid component of Angle( p || pitch, y || yaw, r || roll ) to snap such as Angle( 80, 40, 30 ):SnapTo( \"p\", 90 ):SnapTo( \"y\", 45 ):SnapTo( \"r\", 40 ); and yes, you can keep adding snaps.\n" ); return self; end

	self[ component ] = math.Round( self[ component ] / degrees ) * degrees
	self[ component ] = math.NormalizeAngle( self[ component ] )

	return self

end

--[[---------------------------------------------------------
	Angle ToString returns "p y r" so that __tostring
	can be altered without breaking game-modes!

	delimiter = " ": allows you to set your own delimiter
	between the individual values.

	postfix = "": allows you to set your own postfix
	at the end of the output to make Exploding the
	data easy.
-----------------------------------------------------------]]
function meta:Serialize( delimiter, postfix )

	local delimiter = ( isstring( delimiter ) ) && delimiter || " "
	local postfix = ( isstring( postfix ) ) && postfix || ""
	return string.format( "%d%s%d%s%d%s", self.p, delimiter, self.y, delimiter, self.r, postfix )

end
