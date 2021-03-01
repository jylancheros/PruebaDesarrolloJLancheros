--Consulta de Clientes que han comprado un acumulado $100.000 en los últimos 60 días

SELECT IDCliente,tipoDocumentoCliente,documentoCliente,primerNombreCliente,segundoNombreCliente
		, primerApellidoCliente, segundoApellidoCliente, sum(cantidadProductoDetalle * valorProductoDetalle) AS ACUMULADO
FROM Cliente 
INNER JOIN Valoracion ON IDClienteValoracion =  IDCliente
INNER JOIN Factura ON IDValoracionFactura = IDValoracion
INNER JOIN DetalleFactura ON  IDFacturaDetalle = IDFactura
WHERE fechaFactura between DATEADD(DAY,-30,GETDATE())  and  GETDATE() 
GROUP BY IDCliente,tipoDocumentoCliente,documentoCliente,primerNombreCliente,segundoNombreCliente
		, primerApellidoCliente, segundoApellidoCliente
HAVING sum(cantidadProductoDetalle * valorProductoDetalle) > 100000


--Consulta de los 100 productos más vendidos en los últimos 30 días

SELECT TOP 100 IDProducto,referenciaProducto,descripcionProducto, SUM(cantidadProductoDetalle) AS CANTVENDIDOS FROM Producto
INNER JOIN DetalleFactura ON IDProductoDetalle =  IDProducto
INNER JOIN Factura ON IDFactura = IDFacturaDetalle
WHERE fechaFactura between DATEADD(DAY,-30,GETDATE())  and  GETDATE() 
GROUP BY IDProducto,referenciaProducto,descripcionProducto
ORDER BY SUM(cantidadProductoDetalle) DESC

--Consulta de las tiendas que han vendido más de 100 UND del producto 100 en los últimos 60 días.
--TIENDA CON MAS DE 100 UND DE VENTA EN PRODUCTOS

SELECT IDTienda,descripcionTienda,referenciaProducto, descripcionProducto, SUM(cantidadProductoDetalle) AS CANT
FROM Tienda
INNER JOIN Factura on IDTiendaFactura =  IDTienda
INNER JOIN DetalleFactura ON  IDFacturaDetalle = IDFactura
INNER JOIN Producto ON IDProducto = IDDetalleFactura
WHERE fechaFactura between DATEADD(DAY,-60,GETDATE())  and  GETDATE() 
GROUP BY IDTienda,descripcionTienda,referenciaProducto, descripcionProducto
HAVING SUM(cantidadProductoDetalle) >= 100








