module.exports=function(app,db)
{
	app.post('/producto', function (req, res) {
        db.insertNode({
            nombre: 'Prabjot',
            precio: 4000
        },function(err, node){
            if(err) throw err;
            // Output node properties.
            console.log(node.data);
            // Output node id.
            console.log(node._id);
        });
	});

    app.get('/producto', function (req, res) {
        db.readNode(12, function(err, node){
            if(err){
                console.log("err is"+err);
                throw err;
            }
            // Output node properties.
            console.log(node);
            res.send(node); // so there is cool feature of ejs,we set response in variable “node” and we 			can access it on html as like that (<%= node %>) 
        });
    });
    app.put('/producto', function (req, res) {
        db.updateNode(12, {precio:9000}, function(err, node){
            if(err) throw err;
            if(node === true){
                // node updated
            } else {
                // node not found, hence not updated
            }
        });
    });
    app.delete('/productoDelete', function (req, res) {
        db.deleteNode(12, function(err, node){
        if(err) throw err;
            if(node === true){
                // node deleted
            } else {
                // node not deleted because not found or because of existing relationships
            }
        });
    });
}