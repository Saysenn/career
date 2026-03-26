Super admin maker

-- Replace the email of the user you want to make super_admin
DO $$
DECLARE
    user_uuid uuid;
BEGIN
    -- Get the user's UUID from their email
    SELECT id INTO user_uuid
    FROM auth.users
    WHERE email = 'sadmintracker@tasker.com';

    IF NOT FOUND THEN
        RAISE EXCEPTION 'User with email sadmintracker@tasker.com not found';
    END IF;

    -- Check if the user already has a role
    IF EXISTS (SELECT 1 FROM public.user_roles WHERE user_id = user_uuid) THEN
        -- Update existing role to super_admin
        UPDATE public.user_roles
        SET role = 'super_admin'
        WHERE user_id = user_uuid;
    ELSE
        -- Insert a new super_admin role
        INSERT INTO public.user_roles (user_id, role)
        VALUES (user_uuid, 'super_admin');
    END IF;
END $$;

-- Verify the change
SELECT u.email, ur.role
FROM auth.users u
LEFT JOIN public.user_roles ur ON u.id = ur.user_id
WHERE u.email = 'sadmintracker@tasker.com';