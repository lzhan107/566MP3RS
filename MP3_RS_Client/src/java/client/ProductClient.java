/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package client;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.GenericType;
import com.sun.jersey.api.client.UniformInterfaceException;
import com.sun.jersey.api.client.WebResource;
import entity.Product;
import java.util.ArrayList;
import java.util.List;

/**
 * Jersey REST client generated for REST resource:ProductFacadeREST
 * [entity.product]<br>
 *  USAGE:
 * <pre>
 *        ProductClient client = new ProductClient();
 *        Object response = client.XXX(...);
 *        // do whatever with response
 *        client.close();
 * </pre>
 *
 * @author Lei
 */
public class ProductClient {
    private WebResource webResource;
    private Client client;
    private static final String BASE_URI = "http://localhost:8080/MP3_RS/webresources";

    public ProductClient() {
        com.sun.jersey.api.client.config.ClientConfig config = new com.sun.jersey.api.client.config.DefaultClientConfig();
        client = Client.create(config);
        webResource = client.resource(BASE_URI).path("entity.product");
    }

    public void remove(String id) throws UniformInterfaceException {
        webResource.path(java.text.MessageFormat.format("{0}", new Object[]{id})).delete();
    }

    public String countREST() throws UniformInterfaceException {
        WebResource resource = webResource;
        resource = resource.path("count");
        return resource.accept(javax.ws.rs.core.MediaType.TEXT_PLAIN).get(String.class);
    }

    public <T> T findAll_XML(Class<T> responseType) throws UniformInterfaceException {
        WebResource resource = webResource;
        return resource.accept(javax.ws.rs.core.MediaType.APPLICATION_XML).get(responseType);
    }

    public <T> T findAll_JSON(Class<T> responseType) throws UniformInterfaceException {
        WebResource resource = webResource;
        return resource.accept(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(responseType);
    }

    public void edit_XML(Object requestEntity) throws UniformInterfaceException {
        webResource.type(javax.ws.rs.core.MediaType.APPLICATION_XML).put(requestEntity);
    }

    public void edit_JSON(Object requestEntity) throws UniformInterfaceException {
        webResource.type(javax.ws.rs.core.MediaType.APPLICATION_JSON).put(requestEntity);
    }

    public void create_XML(Object requestEntity) throws UniformInterfaceException {
        webResource.type(javax.ws.rs.core.MediaType.APPLICATION_XML).post(requestEntity);
    }

    public void create_JSON(Object requestEntity) throws UniformInterfaceException {
        webResource.type(javax.ws.rs.core.MediaType.APPLICATION_JSON).post(requestEntity);
    }

    public <T> T findRange_XML(Class<T> responseType, String from, String to) throws UniformInterfaceException {
        WebResource resource = webResource;
        resource = resource.path(java.text.MessageFormat.format("{0}/{1}", new Object[]{from, to}));
        return resource.accept(javax.ws.rs.core.MediaType.APPLICATION_XML).get(responseType);
    }

    public <T> T findRange_JSON(Class<T> responseType, String from, String to) throws UniformInterfaceException {
        WebResource resource = webResource;
        resource = resource.path(java.text.MessageFormat.format("{0}/{1}", new Object[]{from, to}));
        return resource.accept(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(responseType);
    }

    public <T> T find_XML(Class<T> responseType, String id) throws UniformInterfaceException {
        WebResource resource = webResource;
        resource = resource.path(java.text.MessageFormat.format("{0}", new Object[]{id}));
        return resource.accept(javax.ws.rs.core.MediaType.APPLICATION_XML).get(responseType);
    }

    public <T> T find_JSON(Class<T> responseType, String id) throws UniformInterfaceException {
        WebResource resource = webResource;
        resource = resource.path(java.text.MessageFormat.format("{0}", new Object[]{id}));
        return resource.accept(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(responseType);
    }

    public void close() {
        client.destroy();
    }
    
    public static List<Product> getProductList(){
        List<Product> products = new ArrayList<Product>();
        ProductClient productClient = new ProductClient();
        ClientResponse clientResponse = productClient.findAll_XML(ClientResponse.class);
        GenericType<List<Product>> genericType = new GenericType<List<Product>>(){};
        products = clientResponse.getEntity(genericType);
        return products;
    }
    
    public static void createProduct(Product p){
        ProductClient client = new ProductClient();
        ClientResponse clientResponse = client.findAll_XML(ClientResponse.class);
        GenericType<List<Product>> genericType = new GenericType<List<Product>>() {
        };
        List<Product> products = new ArrayList<Product>();
        products = clientResponse.getEntity(genericType);
        Product product = new Product();
        product.setProductId(p.getProductId());
        product.setManufacturerId(p.getManufacturerId());
        product.setProductCode(p.getProductCode());
        product.setPurchaseCost(p.getPurchaseCost());
        product.setQuantityOnHand(p.getQuantityOnHand());
        product.setMarkup(p.getMarkup());
        product.setAvailable(p.getAvailable());
        product.setDescription(p.getDescription());
        client.create_XML(product);
    }
    
    public static Product retrieveProduct(String num){
        ProductClient client = new ProductClient();
        int n = Integer.valueOf(num);
        List<Product> products = getProductList();
        for (int i = 0; i < products.size(); i++) {
            if (i+1== n) {
                n = products.get(i).getProductId();
                break;
            }
        }
        String s = String.valueOf(n);
        ClientResponse clientResponse = client.find_XML(ClientResponse.class, s);
        GenericType<Product> genericType = new GenericType<Product>() {
        };
        Product product = (Product) clientResponse.getEntity(genericType);
        return product;
    }
    
    public static void updateProduct(Product p){
        ProductClient client = new ProductClient();
        int id = p.getProductId();
        String s = String.valueOf(id);
        ClientResponse clientResponse = client.find_XML(ClientResponse.class, s);
        GenericType<Product> genericType = new GenericType<Product>(){};
        Product product = (Product) clientResponse.getEntity(genericType);
        
        product.setProductId(p.getProductId());
        product.setManufacturerId(p.getManufacturerId());
        product.setProductCode(p.getProductCode());
        product.setPurchaseCost(p.getPurchaseCost());
        product.setQuantityOnHand(p.getQuantityOnHand());
        product.setMarkup(p.getMarkup());
        product.setAvailable(p.getAvailable());
        product.setDescription(p.getDescription());
        client.edit_XML(product);
    }
    
    public static void deleteProduct(String num){
        ProductClient client = new ProductClient();
        int n = Integer.valueOf(num);
        List<Product> products = getProductList();
        for (int i = 0; i < products.size(); i++) {
            if (i+1== n) {
                n = products.get(i).getProductId();
                break;
            }
        }
        String s = String.valueOf(n);
        client.remove(s);
    }
}
