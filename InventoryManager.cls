public class InventoryManager {
    // Method to update inventory when a product is purchased
    public static void updateInventory(Id productId, Integer quantityPurchased) {
        // Retrieve the product record from the database
        Product__c product = [SELECT Id, Name, Inventory_Level__c FROM Product__c WHERE Id = :productId];
        
        // Check if there is sufficient inventory
        if (product.Inventory_Level__c >= quantityPurchased) {
            // Deduct the purchased quantity from the inventory level
            product.Inventory_Level__c -= quantityPurchased;
            
            // Update the product record in the database
            update product;
            
            System.debug('Inventory updated successfully for product: ' + product.Name);
        } else {
            System.debug('Inventory update failed: Insufficient stock for product: ' + product.Name);
        }
    }
}

// Example usage
Id productId = 'a011k00003zzzzzzz'; // Example Product ID
Integer quantityPurchased = 5; // Quantity purchased

InventoryManager.updateInventory(productId, quantityPurchased);