CREATE OR REPLACE FUNCTION get_order_message(status_text TEXT)
RETURNS TEXT AS $$
DECLARE
    result TEXT;
BEGIN
    -- Multiple IF conditions
    IF status_text = 'Pending' THEN
        result := 'Your order is pending. Please wait.';
    ELSIF status_text = 'Shipped' THEN
        result := 'Your order is on the way!';
    ELSIF status_text = 'Delivered' THEN
        result := 'Your order has been delivered.';
    ELSIF status_text = 'Cancelled' THEN
        result := 'Your order was cancelled.';
    ELSE
        result := 'Unknown order status.';
    END IF;

    RETURN result;
END;
$$ LANGUAGE plpgsql;


--example using switch

CREATE OR REPLACE FUNCTION get_order_message_case(status_text TEXT)
RETURNS TEXT AS $$
BEGIN
    RETURN CASE status_text
        WHEN 'Pending' THEN 'Your order is pending. Please wait.'
        WHEN 'Shipped' THEN 'Your order is on the way!'
        WHEN 'Delivered' THEN 'Your order has been delivered.'
        WHEN 'Cancelled' THEN 'Your order was cancelled.'
        ELSE 'Unknown order status.'
    END;
END;
$$ LANGUAGE plpgsql;

SELECT get_order_message('Shipped');
SELECT get_order_message_case('Delivered');
